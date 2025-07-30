struct InnerA {
    ax: Int;
    ay: Int;
}

struct InnerB {
    bx: Bool;
    by: String;
}

struct Top {
    one: InnerA;
    two: InnerB;
    comment: String;
    enabled: Bool;
}

contract DeepNested {
    data: Top;

    init() {
        self.data = Top{
            one: InnerA{ax:1, ay:2},
            two: InnerB{bx:true, by:"hi"},
            comment: "initialized",
            enabled: true
        };
    }
}