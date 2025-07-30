struct EnumLike {
    kind: Int as uint2 = 0; // emulate enum {0,1,2,3}
    payload: String?;
}

contract EnumStructStorage {
    state: EnumLike;

    init() {
        self.state = EnumLike{
            kind: 1,
            payload: "Something",
        };
    }
}