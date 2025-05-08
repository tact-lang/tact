fun test() {
    let value: Int = 123;    // full declaration with type and value
    let vInferred = 123;       // inferred type Int
    let vExplicitCtx: Context = context(); // explicit type Context, a built-in Struct
    let vCtx = context();                  // inferred type Context
}
