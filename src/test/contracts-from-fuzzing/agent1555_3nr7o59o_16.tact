struct OptionalDefaultsStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptDefaultsStructContract {
    o: OptionalDefaultsStruct;

    init() {
        self.o = OptionalDefaultsStruct{
            a: null,
            b: null,
            s: null
        };
    }

    receive(){}
}