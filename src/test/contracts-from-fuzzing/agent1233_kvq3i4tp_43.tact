struct A {
    b: Bool?;
    i: Int?;
}

contract NestedAllOpt {
    a: A;

    init() {
        self.a = A{b:null,i:null};
    }
}