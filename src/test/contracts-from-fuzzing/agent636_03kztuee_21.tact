struct IntOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract MultipleOptionalInts {
    data: IntOptionals;

    init() {
        self.data = IntOptionals{ a:null, b:null, c:null };
    }
}
