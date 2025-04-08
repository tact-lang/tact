struct NestedMany {
    l1: Int;
    l2: Inner;
    l3: Inner;
}

struct Inner {
    a: Int?;
    b: Int;
    c: Int?;
}

contract TestContract {
    datamany: NestedMany;

    init() {
        self.datamany = NestedMany{
            l1: 11,
            l2: Inner{a:null, b:2, c:null},
            l3: Inner{a:null, b:3, c:null}
        };
    }
}