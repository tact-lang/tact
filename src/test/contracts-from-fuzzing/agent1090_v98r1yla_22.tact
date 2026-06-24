struct OptPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptPrimStruct {
    s: OptPrimitives;

    init() {
        self.s = OptPrimitives{
            i: null,
            b: null,
            s: null
        };
    }
}