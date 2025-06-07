struct Sub {
    x: Int;
}

struct Main {
    a: Int;
    s: Sub?;
}

contract Test {
    m: Main;

    init() {
        self.m = Main{
            a: 10,
            s: null,
        };
    }

    receive() {}
}