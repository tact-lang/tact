struct Set1 {
    a: Int as uint32;
    b: Bool;
}

struct Set2 {
    c: Int as int64;
    d: String;
}

struct Sets {
    s1: Set1;
    s2: Set2;
}

contract NestedSerialization {
    data: Sets;

    init() {
        self.data = Sets{
            s1: Set1{a:123,b:false},
            s2: Set2{c:-456, d:"hello"}
        };
    }
}