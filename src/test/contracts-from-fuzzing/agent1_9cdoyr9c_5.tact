/// Test Case: Extension Functions on Primitive Types
// This snippet tests the extension function mechanism for primitives.
// We define an extension function `double` for Int that returns the doubled value.

extends fun double(self: Int): Int {
    return self + self;
}

fun test_extension() {
    let x = 10;
    let y = x.double(); // expected to be 20
    dump(y);
}

fun main() {
    test_extension();
}
