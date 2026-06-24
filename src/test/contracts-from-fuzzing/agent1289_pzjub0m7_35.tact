struct NestedTail {
    id: Int;
    extra: Slice as remaining;
}

struct OuterTail {
    info: NestedTail;
    status: Bool;
}

contract NestedRemainingStorage {
    data: OuterTail;

    init() {
        self.data = OuterTail{
            info: NestedTail{
                id: 777,
                extra: emptyCell().asSlice()
            },
            status: true
        };
    }
}