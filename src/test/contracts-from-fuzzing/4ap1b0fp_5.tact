// The following snippet checks one of the early documented features: using trailing commas in function parameter lists and call argument lists.

fun foo(
    a: Int, // trailing comma is allowed per the docs
) {
    dump(a);
}

fun main() {
    foo(
        42, // trailing comma in call arguments is also allowed according to the docs
    );
}
