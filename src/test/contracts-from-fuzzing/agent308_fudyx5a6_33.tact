struct Arrange {
    i1: Int;
    s1: String;
    b1: Bool;
    i2: Int;
    s2: String;
    b2: Bool;
}

contract FieldArrangement {
    st: Arrange;

    init() {
        self.st = Arrange {
            i1:1, s1:"a", b1:true,
            i2:2, s2:"b", b2:false
        };
    }
}
