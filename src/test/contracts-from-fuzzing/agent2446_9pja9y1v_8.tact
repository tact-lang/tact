struct StrNest1 { s: String; }
struct StrNest2 { inner: StrNest1; }

contract StringNestedContract {
    nested: StrNest2;

    init() {
        self.nested = StrNest2{ inner: StrNest1{ s: "test" } };
    }
}