struct A {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct B {
    f4: Int;
    f5: Bool;
    f6: String;
}

contract Test {
    a: A;
    b: B;

    init() {
        self.a = A{f1:1, f2:true, f3:"x"};
        self.b = B{f4:2, f5:false, f6:"y"};
    }
}