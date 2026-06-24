struct Layer3 {
    foo: Int;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract TestContract {
    l1: Layer1;

    init() {
        self.l1 = Layer1{l2: Layer2{l3: Layer3{foo: 99}}};
    }

    receive() {
        let _ = self.l1.l2.l3.foo;
    }
}