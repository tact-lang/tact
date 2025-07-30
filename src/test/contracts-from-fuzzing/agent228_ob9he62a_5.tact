struct Level2 {
    id: Int as uint64;
    info: String;
}

struct Level1 {
    num: Int as int32;
    l2: Level2;
    tail: Slice as remaining;
}

contract TestContract {
    persistent: Level1;

    init() {
        self.persistent = Level1{
            num: -42,
            l2: Level2{
                id: 99,
                info: "abc"
            },
            tail: emptyCell().asSlice()
        };
    }
}