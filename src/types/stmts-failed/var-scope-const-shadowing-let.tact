primitive Int;

const foo: Int = 42;

fun bar(): Int {
    let foo = 43;  // <-- local var `foo` shadows global const `foo`
    return foo;
}

