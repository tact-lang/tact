///////////////////////////////
// Test 17: Nested destructuring split into two steps using discards in inner let binding
// Expected: Compiles successfully by destructuring outer structure first, then destructuring inner structure to discard its field.

struct Inner { value: Int; }
struct Outer { inner: Inner; flag: Bool; }

contract Test {
    receive() {
        let Outer { inner, flag: f } = Outer { inner: Inner { value: 42 }, flag: true };
        let Inner { value: _ } = inner;
        dump(f); // Expected to dump true
    }
}
