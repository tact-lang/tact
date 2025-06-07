// contract with very deep nested optionals
struct D4 { inner: Int?; }
struct D3 { inner: D4?; }
struct D2 { inner: D3?; }
struct D1 { inner: D2?; }

contract DeeplyOptional {
    val: D1;

    init() {
        self.val = D1{ inner: null };
    }
}
