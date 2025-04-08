struct Deep {
    a: Int;
    b: Bool;
}

struct Wrap1 {
    d: Deep;
}

struct Wrap2 {
    w1: Wrap1;
}

struct Wrap3 {
    w2: Wrap2;
}

contract DeepWrap {
    info: Wrap3;
    init() {
        self.info = Wrap3{ w2: Wrap2{ w1: Wrap1{ d: Deep{ a:1, b:true } } } };
    }
    receive() {
        self.info = Wrap3{ w2: Wrap2{ w1: Wrap1{ d: Deep{ a:2, b:false } } } };
    }
}