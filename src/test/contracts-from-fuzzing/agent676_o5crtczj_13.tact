struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    x: Bool?;
    y: String;
}

contract TestContract {
    f1: Inner1;
    f2: Inner2;
    f3: Int;
    f4: Bool;

    init() {
        self.f1 = Inner1{a:10,b:true};
        self.f2 = Inner2{x:null,y:"abc"};
        self.f3 = 42;
        self.f4 = false;
    }
}