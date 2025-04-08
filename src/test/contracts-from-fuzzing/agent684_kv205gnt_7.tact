struct WithManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    optStruct: WithManyOptional;

    init() {
        self.optStruct = WithManyOptional {
            a: null,
            b: true,
            c: null,
            d: null
        };
    }

    receive() {
        if (self.optStruct.a != null) { dump(self.optStruct.a!!); }
        if (self.optStruct.b != null) { dump(self.optStruct.b!!); }
    }
}
