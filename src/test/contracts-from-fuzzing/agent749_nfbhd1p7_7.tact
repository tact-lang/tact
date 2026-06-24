struct ChainA {
    x: Int;
    next: ChainB;
}

struct ChainB {
    y: Bool;
    next: ChainC;
}

struct ChainC {
    z: String;
}

contract TestContract {
    start: ChainA;

    init() {
        self.start = ChainA{
            x: 1,
            next: ChainB{
                y: true,
                next: ChainC{
                    z: "end",
                },
            },
        };
    }

    receive() {
        let _ = self.start.next.next.z;
    }
}