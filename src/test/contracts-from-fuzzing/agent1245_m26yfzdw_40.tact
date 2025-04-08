struct Sub {
    foo: Int;
}

contract SubOptContract {
    sub: Sub?;

    init() {
        self.sub = Sub{ foo: 999 };
    }
}
