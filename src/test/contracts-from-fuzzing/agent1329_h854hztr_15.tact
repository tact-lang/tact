struct Test1 {
    a: Int;
}

struct Test2 {
    a: Int;
}

struct Combine {
    t1: Test1;
    t2: Test2;
}

contract MultiStructs {
    v: Combine;

    init() {
        self.v = Combine{ t1: Test1{a:1}, t2: Test2{a:2} };
    }
}
