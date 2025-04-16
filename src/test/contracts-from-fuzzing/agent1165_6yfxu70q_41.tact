struct OptPrimsStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract OptionVariants {
    cont: OptPrimsStruct;

    init() {
        self.cont = OptPrimsStruct{ a: null, b: null, c: null, d: null, e: null, f: null };
    }
}
