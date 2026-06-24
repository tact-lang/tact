struct DeepNested {
    a: Int;
    b: Bool;
}

struct Middle {
    n1: DeepNested;
    n2: DeepNested;
}

struct Top {
    m: Middle;
    flag: Bool;
}

contract NestingContract {
    data: Top;
    init() {
        self.data = Top{
            m: Middle{
                n1: DeepNested{ a: 1, b: true },
                n2: DeepNested{ a: 2, b: false } },
            flag: true
        };
    }

    receive() {
        self.data = Top{
            m: Middle{
                n1: DeepNested{ a: 3, b: false },
                n2: DeepNested{ a: 4, b: true } },
            flag: false
        };
    }
}