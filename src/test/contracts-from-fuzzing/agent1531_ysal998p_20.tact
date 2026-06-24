struct IntFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct BoolString {
    f: Bool;
    g: String;
}

struct Combined {
    intstuff: IntFields;
    boolstr: BoolString;
}

contract Nested {
    data: Combined;

    init() {
        self.data = Combined{
            intstuff: IntFields{a:1,b:2,c:3,d:4,e:5},
            boolstr: BoolString{f:true,g:"hello"},
        };
    }
}
