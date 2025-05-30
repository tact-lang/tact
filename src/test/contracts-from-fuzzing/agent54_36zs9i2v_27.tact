struct D1 { a: Int; b: Bool; }
struct D2 { inner: D1; optional: Int?; }
contract NestedDefault {
    data: D2;
    init() {
        self.data = D2{
            inner: D1{ a:5, b:true },
            optional: null
        };
    }
}