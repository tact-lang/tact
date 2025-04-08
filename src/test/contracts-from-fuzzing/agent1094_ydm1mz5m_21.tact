struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract WithTuple {
    data1: S;
    data2: S;

    init() {
        self.data1 = S{a:1,b:2,c:3};
        self.data2 = S{a:4,b:5,c:6};
    }
}