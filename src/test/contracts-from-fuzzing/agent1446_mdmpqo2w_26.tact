struct A {
    a: Int;
    b: String;
    c: Bool?;
}

contract M {
    data1: A;
    data2: A;
    init() {
        self.data1 = A{a:1,b:"x",c:null};
        self.data2 = A{a:2,b:"y",c:true};
    }
}
