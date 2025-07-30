struct DeepInner {
    foo: Int = 1;
    bar: String = "bar";
}

struct MidLevel {
    d: DeepInner;
    x: Int = 10;
}

struct TopLevel {
    mid: MidLevel;
    y: Bool = false;
}

contract DefaultNested {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            mid: MidLevel{
                d: DeepInner{},
                x: 99
            },
            y: true
        };
    }

    receive() {
        dump(self.data.mid.d.foo);
    }
}