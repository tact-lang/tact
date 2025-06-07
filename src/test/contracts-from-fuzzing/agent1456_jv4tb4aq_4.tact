struct OptStruct {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
    maybeAddr: Address?;
}

contract TestContract {
    opt: OptStruct;

    init() {
        self.opt = OptStruct{
            maybeInt: null,
            maybeBool: true,
            maybeString: null,
            maybeAddr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        };
    }

    receive() {
        self.opt = OptStruct{
            maybeInt: 42,
            maybeBool: null,
            maybeString: "hello",
            maybeAddr: null,
        };
    }
}