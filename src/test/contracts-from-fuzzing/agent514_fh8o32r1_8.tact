struct Mid {
    i: Int;
    s: String;
    b: Bool;
}

struct Outer {
    intField: Int;
    midField: Mid;
    addr: Address;
}

contract MixedTypes {
    state: Outer;
    init() {
        self.state = Outer{
            intField: 10,
            midField: Mid{ i:1, s:"hi", b:true },
            addr: myAddress()
        };
    }
}