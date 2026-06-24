struct Flat {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

struct NestedFlat {
    one: Flat;
    two: Flat;
    three: Flat;
}

contract NestedRepeatedStructs {
    s: NestedFlat;

    init() {
        self.s = NestedFlat{
            one: Flat{a:1,b:2,c:3,d:4},
            two: Flat{a:5,b:6,c:7,d:8},
            three: Flat{a:9,b:10,c:11,d:12}
        };
    }
}
