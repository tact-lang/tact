struct BoolOptInt {
    b: Bool;
    opt: Int?;
}

contract OptionalNonDefault {
    f: BoolOptInt;
    init() {
        self.f = BoolOptInt{
            b:true,
            opt:null,
        };
    }
}