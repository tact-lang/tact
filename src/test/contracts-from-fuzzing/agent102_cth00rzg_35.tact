struct MessageLike {
    header: Int;
    payload: String;
}

contract StructContainingBytes {
    s: MessageLike;

    init() {
        self.s = MessageLike{ header: 1, payload: "abc" };
    }
}