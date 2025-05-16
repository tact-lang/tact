struct Container {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptFields {
    data: Container;

    init() {
        self.data = Container{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}
