// contract nesting multiple levels of optionals more deeply, until failure
struct D6 { inner: Int?; }
struct D5 { inner: D6?; }
struct D4 { inner: D5?; }
struct D3 { inner: D4?; }
struct D2 { inner: D3?; }
struct D1 { inner: D2?; }

contract UltraDeepOptional {
    val: D1;

    init() {
        self.val = D1{ inner: null };
    }
}
