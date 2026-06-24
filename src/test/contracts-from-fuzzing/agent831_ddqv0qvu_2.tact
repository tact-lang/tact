struct Params {
    s: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{
            s: "hello",
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}