struct A {
    f1: Bool;
    f2: Int?;
    f3: String;
    f4: Bool?;
}

struct B {
    a: A;
    x: Int;
    s: String;
}

contract Storage {
    b: B;

    init() {
        self.b = B{
            a: A{f1:false,f2:null,f3:"abc",f4:true},
            x: 3,
            s: "q"
        };
    }
}