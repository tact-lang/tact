struct Mix {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    strVal: String;
    addrOpt: Address?;
}

contract TestContract {
    f: Mix;

    init() {
        self.f = Mix{
            intVal: 10,
            boolVal: false,
            optInt: null,
            strVal: "xyz",
            addrOpt: null
        };
    }
}