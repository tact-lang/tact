struct InnerMost {
    x: Int;
    y: Int;
}

struct MidLevel {
    a: InnerMost;
    b: InnerMost;
}

struct Outer1 {
    left: MidLevel;
}

struct Outer2 {
    right: MidLevel;
}

struct Envelope {
    one: Outer1;
    two: Outer2;
}

contract DoubleNested {
    state: Envelope;

    init() {
        self.state = Envelope{
            one: Outer1{left: MidLevel{a: InnerMost{x:1, y:2}, b: InnerMost{x:3,y:4}}},
            two: Outer2{right: MidLevel{a: InnerMost{x:5,y:6}, b: InnerMost{x:7,y:8}}}
        };
    }
}