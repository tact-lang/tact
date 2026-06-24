struct NestedMany {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

struct Container {
    one: NestedMany;
    two: NestedMany;
    three: NestedMany;
}

contract Test {
    store: Container;

    init() {
        self.store = Container{
            one: NestedMany{a:1,b:2,c:3,d:4,e:5,f:6},
            two: NestedMany{a:7,b:8,c:9,d:10,e:11,f:12},
            three: NestedMany{a:13,b:14,c:15,d:16,e:17,f:18}
        };
    }
}