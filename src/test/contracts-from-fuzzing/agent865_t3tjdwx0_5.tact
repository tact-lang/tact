struct Child {
    s: String = "str";
    b: Bool = true;
    i: Int = 10;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract MultiChild {
    payload: Parent;

    init() {
        self.payload = Parent{
            c1: Child{s:"a",b:true,i:1},
            c2: Child{s:"b",b:false,i:2},
            c3: Child{s:"c",b:true,i:3},
        };
    }
}
