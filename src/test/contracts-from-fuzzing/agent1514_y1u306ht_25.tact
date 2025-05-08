struct OddSizes {
    a: Int as uint3;
    b: Int as int5;
    c: Int as uint7;
}

contract Test {
    field: OddSizes = OddSizes{a:1,b:2,c:3};
    init() {
        self.field = OddSizes{a:4,b:5,c:6};
    }
}