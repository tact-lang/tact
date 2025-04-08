struct Payload {
    id: Int;
    data: Slice as remaining;
}

struct Wrapper {
    meta: Payload;
    txt: String;
}

contract RemainingHintDeep {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            meta: Payload{
                id: 123,
                data: emptyCell().asSlice(),
            },
            txt: "rem",
        };
    }
}