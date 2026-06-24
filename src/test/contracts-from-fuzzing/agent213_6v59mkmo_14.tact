struct InnerMost {
    a: Int;
    b: Bool;
}

struct MidLevel {
    x: InnerMost;
    y: Int;
}

struct OuterMost {
    p: MidLevel;
    q: Bool;
}

contract C {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            p: MidLevel{
                x: InnerMost{ a:1, b:true }, y:5
            },
            q: false
        };
    }
}