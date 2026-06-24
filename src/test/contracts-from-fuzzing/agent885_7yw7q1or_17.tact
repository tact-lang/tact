// Nested optional struct two levels deep with default nested null
struct L2 { foo: Int? }
struct L1 { inner: L2? }

contract NestedNulls {
    data: L1?;

    init() {
        self.data = L1 {
            inner: null
        };
    }
}
