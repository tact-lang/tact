struct SameType {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
}

contract SameTypeFields {
    s: SameType;

    init() {
        self.s = SameType{
            x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7
        };
    }
}
