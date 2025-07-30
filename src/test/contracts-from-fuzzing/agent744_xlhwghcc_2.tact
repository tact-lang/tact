struct WithOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    nestedStruct: Nested?;
}

struct Nested {
    flag: Bool;
    number: Int;
}

contract TestContract {
    data: WithOptional;

    init() {
        self.data = WithOptional{
            maybeInt: null,
            maybeBool: true,
            nestedStruct: Nested{ flag: false, number: -1 }
        };
    }
}