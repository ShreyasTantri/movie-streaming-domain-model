/*
Objective
The purpose of this assignment is NOT to practice Enum syntax.
The objective is to think like an iOS Engineer who is designing a robust, scalable and type-safe domain
model.
Throughout this assignment, continuously ask yourself:
"Can my model represent an invalid state?"
If the answer is Yes, redesign it.
Problem Statement
You are designing the backend models for a Movie Streaming Application (similar to Netflix / Prime
Video).
Design the domain models using Swift.
Avoid using String or Int where an Enum would make the design safer.
Avoid multiple Optional properties if they can create invalid states.
Feature 1 — User Subscription
A user can have one of the following subscription plans:
 Free
 Mobile
 Premium
 Family

Think carefully.
 1. Does each plan require additional information?
 No. Not every subscription plan requires additional information. A plan like Free can be fully represented by its type alone because there is no extra information needed to describe it.However, plans such as Family may require additional information (for example, the number of allowed members) to completely define the subscription.
******
 2. Can some plans carry Associated Values?
 Yes. Plans that require additional information can use associated values. For example, a Family plan could carry the maximum number of allowed members. This ensures that the required information always exists whenever that plan is used.
******
 */
