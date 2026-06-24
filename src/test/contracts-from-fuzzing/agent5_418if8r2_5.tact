struct Inner { a: Int }
struct Middle { inner: Inner? }
struct Outer { middle: Middle? }

contract NestedOptionalTest {
    receive() {
        // Construct deeply nested structure with optionals
        let instance: Outer = Outer{
            middle: Middle{
                inner: Inner{ a: 123 }
            }
        };
    }
}
