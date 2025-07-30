struct Sub {
    val: Int;
}

struct Holder {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
    str: String;
}

contract TestContract {
    holder: Holder;

    init() {
        self.holder = Holder {
            sub1: Sub{val:1},
            sub2: Sub{val:2},
            sub3: Sub{val:3},
            str: "test"
        };
    }

    receive() {}
}