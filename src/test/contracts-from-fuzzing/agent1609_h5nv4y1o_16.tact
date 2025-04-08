// Optionals at multiple nesting levels with primitive serialization
struct P {
    x: Int? as int32;
    y: Bool?;
}

struct Q {
    p: P?;
    z: Int as uint64;
}

contract TestContract {
    q: Q?;

    init() {
        self.q = Q{
            p: P{
                x: null,
                y: true
            },
            z: 555
        };
    }

    receive() {
        self.q = null;
    }
}