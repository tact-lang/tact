struct Data {
    optInt: Int?;
    optBool: Bool?;
    str: String;
}

contract Test {
    stored: Data;

    init() {
        self.stored = Data{
            optInt: null,
            optBool: true,
            str: "hello"
        };
    }
}