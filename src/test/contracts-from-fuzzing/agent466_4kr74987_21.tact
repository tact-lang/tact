struct S {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract NestedOptionPattern {
    data: S;

    init() {
        self.data = S{a:10,b:null,c:20,d:null};
    }
}