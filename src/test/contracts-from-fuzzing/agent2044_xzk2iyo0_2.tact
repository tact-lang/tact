struct Nested {
    value: Int;
}

struct Wrapper {
    nested_opt: Nested?;
    text: String;
    number: Int?;
}

contract DeepOptional {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            nested_opt: null,
            text: "abc",
            number: null,
        };
    }
}