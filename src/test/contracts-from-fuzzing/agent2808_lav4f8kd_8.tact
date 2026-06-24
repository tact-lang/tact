struct A {
    a: Int;
    b: Bool;
}

struct B {
    x: Int?;
    y: Bool?;
}

struct C {
    first: A;
    second: B;
}

contract Test {
    data: C;
    init() {
        self.data = C{
            first: A{a:1,b:true},
            second: B{x:null,y:null}
        };
    }
}