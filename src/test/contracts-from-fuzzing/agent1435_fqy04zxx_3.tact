struct Inner {
    flag: Bool; 
    count: Int;
}

struct Outer {
    i: Int;
    innerField: Inner;
}

contract Holder {
    stored: Outer;

    init() {
        self.stored = Outer{
            i: 7,
            innerField: Inner{ flag: true, count: 42 }
        };
    }
}