struct NestedString {
    s: String;
}

struct Top {
    a: Int;
    b: NestedString;
    c: NestedString?;
}

contract StructsWithStrings {
    data: Top;

    init() {
        self.data = Top{
            a: 5,
            b: NestedString{ s: "hi" },
            c: null,
        };
    }
}
