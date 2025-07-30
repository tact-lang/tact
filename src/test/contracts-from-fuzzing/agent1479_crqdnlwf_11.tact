struct Inner1 {
    a: Int;
}

struct Inner2 {
    a: Bool;
}

struct Inner3 {
    a: Int?;
}

contract Test {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;

    init() {
        self.f1 = Inner1{a:1};
        self.f2 = Inner2{a:true};
        self.f3 = Inner3{a:null};
    }
}