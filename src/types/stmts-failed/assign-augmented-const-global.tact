primitive Int;

const foo: Int = 42;

fun bar() {
    foo += 1 // <-- trying to assign to a constant
}