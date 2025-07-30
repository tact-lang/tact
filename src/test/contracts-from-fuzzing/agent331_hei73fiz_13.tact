struct OptInts {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptionalIntHolder {
    data: OptInts;

    init() {
        self.data = OptInts{a:null, b:null, c:null};
    }
}