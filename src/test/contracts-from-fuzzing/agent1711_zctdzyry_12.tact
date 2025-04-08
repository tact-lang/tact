struct HasStringAndOptional {
    s: String;
    opt: String?;
}

contract TestStringOption {
    data: HasStringAndOptional;

    init() {
        self.data = HasStringAndOptional {
            s: "abc",
            opt: null
        };
    }
}