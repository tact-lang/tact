struct Super {
    a: Int;
}

struct Sub {
    super: Super;
    extra: Int;
}

contract Composition {
    state: Sub;

    init() {
        self.state = Sub{
            super: Super{ a: 1 },
            extra: 2
        };
    }
}
