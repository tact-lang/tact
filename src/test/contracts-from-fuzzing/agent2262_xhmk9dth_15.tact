struct Leaf {
    a: Int as uint8;
    b: Int as int16;
}

struct Branch {
    foo: Leaf;
    bar: Int as uint32;
}

contract Test {
    data: Branch;

    init() {
        self.data = Branch{
            foo: Leaf{ a: 3, b: -100 },
            bar: 77777
        };
    }
}