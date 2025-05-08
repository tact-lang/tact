struct Mid {
    num: Int;
}

struct Outer {
    count: Int;
    rec: Mid;
}

contract UpdateNestedStruct {
    state: Outer;

    init() {
        self.state = Outer{
            count: 5,
            rec: Mid{ num: 42 }
        };
    }
}