struct InnerX {
    val: Int;
}

struct MiddleA {
    x: InnerX;
    y: Bool;
}

struct MiddleB {
    y: String;
    z: Int?;
}

struct Top {
    mA: MiddleA;
    mB: MiddleB;
    done: Bool;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            mA: MiddleA{ x: InnerX{ val: 1 }, y: false },
            mB: MiddleB{ y: "", z: null },
            done: true
        };
    }
}