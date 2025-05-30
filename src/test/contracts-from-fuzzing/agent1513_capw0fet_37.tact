struct Compose {
    x: Int;
}

contract MultipleInit {
    a: Compose;
    b: Compose;
    c: Compose;

    init() {
        self.a = Compose{ x: 1 };
        self.b = Compose{ x: 2 };
        self.c = Compose{ x: 3 };
    }
}