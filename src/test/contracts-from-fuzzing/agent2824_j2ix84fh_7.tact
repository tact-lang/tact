struct Inner {
    innerBool: Bool;
    innerInt: Int;
    innerStr: String;
}

struct Outer {
    o1: Inner;
    o2: Inner;
    o3: Inner;
}

contract MultiNestedSameType {
    val: Outer;

    init() {
        self.val = Outer{
            o1: Inner{ innerBool: true, innerInt: 1, innerStr: "a" },
            o2: Inner{ innerBool: false, innerInt: 2, innerStr: "b" },
            o3: Inner{ innerBool: true, innerInt: 3, innerStr: "c" },
        };
    }
}