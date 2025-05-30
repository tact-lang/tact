struct Bottom {
    f1: Bool;
    f2: Int;
}

struct Middle {
    b: Bottom;
    n: Int;
}

struct Top {
    m: Middle;
    f: Bool;
}

contract TestContract {
    s: Top;

    init() {
        self.s = Top{
            m: Middle{ b: Bottom{ f1:true, f2:99 }, n: 123 },
            f: false
        };
    }
}