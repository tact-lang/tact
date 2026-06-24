struct NestedMany {
    x: Int;
    y: Bool;
    z: String;
}

struct OuterWrap {
    a: NestedMany;
    b: NestedMany;
    c: NestedMany;
    d: NestedMany;
    e: NestedMany;
}

contract TestContract {
    bigfield: OuterWrap;

    init() {
        self.bigfield = OuterWrap{
            a: NestedMany{x:1,y:true,z:"a"},
            b: NestedMany{x:2,y:false,z:"b"},
            c: NestedMany{x:3,y:true,z:"c"},
            d: NestedMany{x:4,y:false,z:"d"},
            e: NestedMany{x:5,y:true,z:"e"}
        };
    }
}