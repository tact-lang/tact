struct L3 { a: Int }
struct L2 { nested: L3 }
struct L1 { inner: L2 }

contract DeepParamNest(
    payload: L1,
) {
    receive() {
        let _ = self.payload.inner.nested.a + 1;
    }
}
