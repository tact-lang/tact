struct Inner { value: Int; }
struct Outer { inner: Inner; }

// Test for nested struct field access and arithmetic operations
fun nestedStructTest(): Int {
    let o: Outer = Outer { inner: Inner { value: 7 } };
    return o.inner.value + (3 * 2);
}

contract NestedStructTest {
    receive() {
         nestedStructTest();
    }
}
