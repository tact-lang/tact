struct Inner {
    optFlag: Bool?;
    optNum: Int?;
}

struct Outer {
    nested: Inner;
    name: String;
}

contract OptionalNestedStructs {
    val: Outer;

    init() {
        self.val = Outer{
            nested: Inner{optFlag: null, optNum: null},
            name: "hello"
        };
    }
}
