'use strict';

/**
 * profile controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::profile.profile', ({strapi}) => ({
    async createMe(ctx){
        try {
            const user = ctx.state.user;
            if(!user){
                return ctx.badRequest('No authorized user found!');
            }
        
            const { fullName } = ctx.request.body;

            const result = await strapi.entityService.create('api::profile.profile', {
                data: {
                    fullName,
                    email: user.email,
                    user: user.id
                }
            });
            return ctx.send(result);
        } catch (err){
            return ctx.badRequest({ messages: [{ id: 'Error', message: err.message }] });
        }
    },
    async getMe(ctx){
        try {
            const user = ctx.state.user;
            if(!user){
                return ctx.badRequest("No authorized user found!");
            }
            const result = await strapi.db.query('api::profile.profile').findOne({
                where:{
                    user: {
                        id: {
                            $eq: user.id
                        }
                    }
                },
                populate: {
                    image: true,
                }
            })
            return result;
        } catch (err){
            return ctx.badRequest({ messages: [{ id: 'Error', message: err.message }] });
        }
    }
}));
