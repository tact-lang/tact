struct A {
    foo: Int;
}

struct B {
    x: A;
    y: A?;
    flag: Bool;
}

contract TestContract {
    data: B = B{x: A{foo:1}, y:null, flag:true};

    init() {
        self.data = B{x: A{foo:2}, y:null, flag:false};
    }

    receive() {
        let _ = self.data;
    }
}