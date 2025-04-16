struct HasOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    data: HasOptionals;

    init() {
        self.data = HasOptionals{
            optInt: 1234,
            optBool: null,
            optStr: "hi"
        };
    }

    receive() {
        let _ = self.data.optStr;
    }
}