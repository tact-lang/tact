// Struct with a nested optional struct inside an optional struct (nested nullables)
struct Leaf {
    value: Int;
}

struct Middle {
    leaf: Leaf?;
    midVal: Int;
}

struct Top {
    middle: Middle?;
    topVal: Bool;
}

contract TestContract {
    nestedOptStruct: Top;

    init() {
        self.nestedOptStruct = Top{
            middle: null,
            topVal: false,
        };
    }
}
