struct Repeated {
    x: Int;
}

contract Repetition {
    a: Repeated;
    b: Repeated;

    init() {
        self.a = Repeated { x: 1 };
        self.b = Repeated { x: 2 };
    }
}