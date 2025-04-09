struct RemainS {
    prefix: Int as uint8;
    tail: Slice as remaining;
}

contract RemainingFieldTest {
    f: RemainS;

    init() {
        self.f = RemainS{
            prefix: 5,
            tail: emptyCell().asSlice(),
        };
    }
}