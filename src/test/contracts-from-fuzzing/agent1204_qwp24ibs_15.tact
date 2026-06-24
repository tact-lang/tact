// Struct with nested deeply multiple levels
struct Bottom {
    z: Int;
}

struct Middle {
    bottom: Bottom;
}

struct Top {
    mid: Middle;
}

contract StackTest {
    record: Top;

    init() {
        self.record = Top{
            mid: Middle{
                bottom: Bottom{z:777}
            }
        };
    }
}