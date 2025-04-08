struct Wrapper {
    field1: Int;
    optionalStruct: Nested?;
}

struct Nested {
    innerBool: Bool;
    innerString: String;
}

contract TestContract {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            field1: 1,
            optionalStruct: null
        };
    }
}
