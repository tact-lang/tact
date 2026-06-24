message(42) InsideMsg {
    val: Int;
}

struct Wrapper {
    msg: InsideMsg;
    flag: Bool;
}

contract TestContract {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            msg: InsideMsg{ val: 123 },
            flag: true,
        };
    }
}
