struct Base {
    i: Int;
}

struct Wrap1 {
    b: Base;
}

struct Wrap2 {
    w: Wrap1;
}

contract MultiWraps {
    data: Wrap2;

    init() {
        self.data = Wrap2{w: Wrap1{b: Base{i: 7}}};
    }
}