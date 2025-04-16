struct A {
    val: Int;
}

struct B {
    a: A;
}

contract Test8 {
    state: B = B{a: A{val: 321}};

    receive() {}

    get fun getNested(): B {
        return self.state;
    }
}
