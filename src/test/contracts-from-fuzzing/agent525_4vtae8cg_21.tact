struct Tail {
    tailData: Slice as remaining;
}

contract TailData {
    rec: Tail;
    init() {
        self.rec = Tail{
            tailData: emptyCell().asSlice(),
        };
    }
}