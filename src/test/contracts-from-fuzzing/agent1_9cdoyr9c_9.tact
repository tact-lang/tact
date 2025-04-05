/// Test Case: Equality Comparison Between Optional and Non-Optional
/// According to the Tact documentation on optionals, there is no implicit conversion between
/// an optional type and its non-optional counterpart. Users must explicitly unwrap an optional
/// before comparing it with a non-optional value.

fun test_optional_equality() {
    let a: Int? = 10;
    let b: Int = 10;
    // Direct comparison should fail because of type mismatch. Uncommenting the line below
    // should lead to a compile-time error.
    // dump(a == b);
    // The correct way is to unwrap the optional:
    dump(a!! == b); // Expected output: true, because 10 == 10
}

fun main() {
    test_optional_equality();
}
