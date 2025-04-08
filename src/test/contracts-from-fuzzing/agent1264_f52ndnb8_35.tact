struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct MultiNested {
    s1: S1;
    s2: S2;
    c: Int;
}

contract MultiStructs {
    data: MultiNested;

    init() {
        self.data = MultiNested{
            s1: S1{a:1}, s2:S2{b:2}, c:3
        };
    }
}