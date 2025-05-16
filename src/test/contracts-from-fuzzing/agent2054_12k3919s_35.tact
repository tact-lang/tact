struct BigNested {
    nested1: FlatMany;
    nested2: FlatMany;
}

struct FlatMany {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract NestedMany {
    data: BigNested = BigNested{
        nested1: FlatMany{a:1,b:2,c:3,d:4,e:5},
        nested2: FlatMany{a:6,b:7,c:8,d:9,e:10}
    };
}