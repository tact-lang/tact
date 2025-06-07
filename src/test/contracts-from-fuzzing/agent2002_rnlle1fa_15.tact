struct Inner {
    value: Int as uint32;
}

struct Outer {
    innerValue: Inner;
    someBool: Bool;
    optInt: Int?;
    str: String;
}

contract NestedCombination {
    data: Outer;

    init() {
        self.data = Outer{
            innerValue: Inner{value: 33},
            someBool: true,
            optInt: null,
            str: "abc"
        };
    }
}
