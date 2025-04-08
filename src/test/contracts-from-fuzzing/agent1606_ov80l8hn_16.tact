struct OptStr {
    data: String?;
}

contract NullStringOpt {
    nested: OptStr;

    init() {
        self.nested = OptStr{
            data: null
        };
    }
}
