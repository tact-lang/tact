// contract direct persistent deeply nested opt struct, innermost containing optional string
struct Deep {
    s: String?;
}
struct Deeper {
    d: Deep?;
}
struct Deepest {
    dd: Deeper?;
}

contract NestedOptString {
    f: Deepest?;

    init() {
        self.f = null;
    }
}