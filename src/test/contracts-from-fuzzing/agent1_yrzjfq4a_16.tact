struct OptionalMixed {
    s: String?;
    b: Bool?;
    addr: Address?;
    intVal: Int?;
}

contract OptMixedStorage {
    s: OptionalMixed;

    init() {
        self.s = OptionalMixed{
            s:null, b:true, addr:null, intVal:42
        };
    }
}