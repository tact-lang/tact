struct Flex {
    optInt: Int?;
    intV: Int;
    optBool: Bool?;
    boolV: Bool;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    flex: Flex;
    init() {
        self.flex = Flex{
            optInt: null,
            intV: 123,
            optBool: null,
            boolV: true,
            nested: null
        };
    }
}