struct Innermost {
    val: Int;
    optFlag: Bool?;
    text: String;
}

struct Middle {
    nested: Innermost;
    active: Bool;
}

struct Outer {
    first: Middle;
    second: Middle;
}

contract DeepNest {
    storage: Outer;

    init() {
        self.storage = Outer{
            first: Middle{nested: Innermost{val: 1, optFlag: null, text: "x"}, active: true},
            second: Middle{nested: Innermost{val: 2, optFlag: false, text: "y"}, active: false}
        };
    }
}