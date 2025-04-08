struct Base {
    a: Int;
}

struct Wrap1 {
    val: Base;
}

struct Wrap2 {
    val: Wrap1;
}

struct Wrap3 {
    val: Wrap2;
}

struct Wrap4 {
    val: Wrap3;
}

struct Wrap5 {
    val: Wrap4;
}

contract MultiWrap {
    data: Wrap5;
    init() {
        self.data = Wrap5{ val: Wrap4{ val: Wrap3{ val: Wrap2{ val: Wrap1{ val: Base{ a: 7 } } } } } };
    }
}