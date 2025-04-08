struct StructWithString {
    s: String;
}

struct Wrapper {
    inner: StructWithString;
}

contract StringNested {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: StructWithString{ s: "data" } };
    }
}