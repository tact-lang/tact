struct BoolOptional {
    a: Bool?;
    b: Bool?;
}

contract TestContract {
    flags: BoolOptional;

    init() {
        self.flags = BoolOptional{
            a: null,
            b: true,
        };
    }
}