message(0x42) M {
    num: Int;
}

struct Info {
    txt: String;
}

struct Container {
    m: M?;
    i: Info?;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{ m: null, i: null };
    }

    receive() {
        self.field = Container{ m: M{ num:7 }, i: Info{ txt:"hi" } };
    }
}