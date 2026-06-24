struct OptionalBasic {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    strVal: String?;
}

contract TestOptional {
    opt: OptionalBasic;
    init() {
        self.opt = OptionalBasic{
            intVal: null,
            boolVal: null,
            addrVal: null,
            strVal: null
        };
    }
}