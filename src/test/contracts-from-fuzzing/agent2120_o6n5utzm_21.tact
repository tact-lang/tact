struct BoolInts {
    b1: Bool;
    b2: Bool;
    i1: Int;
    i2: Int;
}

contract BoolIntFields {
    fields: BoolInts;
    init() {
        self.fields = BoolInts{ b1:true, b2:false, i1:1, i2:2 };
    }
}