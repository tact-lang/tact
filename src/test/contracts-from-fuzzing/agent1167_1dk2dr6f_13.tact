// deeply nested optionals in structs (single optional layer nesting, so valid)
struct D1 { a: Int? }
struct D2 { b: D1? }
struct D3 { c: D2? }
contract Test13 {
    deep: D3;

    init() {
        self.deep = D3{ c: null };
    }
}