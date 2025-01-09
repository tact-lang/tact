primitive Int;

const foo: Int = 42;

fun bar() {
    foo = 43 // <-- trying to assign to a constant
}