struct Container {
    intVal: Int;
    optionalInt: Int?;
    optBool: Bool?;
    str: String;
    addrOpt: Address?;
}

contract OptPrims {
    data: Container;

    init() {
        self.data = Container{
            intVal: 99,
            optionalInt: 100,
            optBool: null,
            str: "hello",
            addrOpt: null
        };
    }
}