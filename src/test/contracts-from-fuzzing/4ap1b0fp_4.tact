// This snippet tests the use of trailing commas in parameter lists and call argument lists, as described in the Functions section of the Tact Book.

fun foo(
    a: Int, // trailing comma is allowed
) {
    dump(a);
}

fun main() {
    foo(
        42, // trailing comma is allowed in call argument lists as well
    );
}
