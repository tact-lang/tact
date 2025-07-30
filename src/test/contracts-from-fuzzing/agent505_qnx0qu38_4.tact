struct DeepNested {
    foo: Int;
    bar: Bool;
}

struct Middle {
    nested: DeepNested;
    note: String?;
}

struct Outer {
    mid: Middle;
    count: Int?;
    flag: Bool = false;
}

contract Complex {
    data: Outer = Outer{
        mid: Middle{
            nested: DeepNested{foo: 5, bar: true},
            note: null,
        },
        count: null,
        flag: true,
    };
    
    init() {
        self.data = self.data;
    }

    receive() {
        self.data = self.data;
    }
}