/* OutOfOrder struct instantiation: tests that fields can be provided out-of-order during instantiation */
struct OutOfOrder {
    a: Int;
    b: String;
}

fun testOutOfOrder() {
    let x = OutOfOrder { b: "world", a: 42 };
}
