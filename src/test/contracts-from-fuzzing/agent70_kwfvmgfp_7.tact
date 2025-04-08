struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    optStruct: ManyOptionals;

    init() {
        self.optStruct = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }

    receive() {
        self.optStruct = ManyOptionals{
            a: 5,
            b: true,
            c: "hi",
            d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }
}