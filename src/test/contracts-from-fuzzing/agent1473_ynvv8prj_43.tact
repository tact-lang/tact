struct Common {
    a: Int;
}

contract TestContract {
    c1: Common;
    c2: Common;

    init() {
        self.c1 = Common{a:1};
        self.c2 = Common{a:2};
    }
}