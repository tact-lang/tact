message InnerEmpty {}

struct Wrap {
    m: InnerEmpty;
}

contract WrapMsg {
    val: Wrap;

    init() {
        self.val = Wrap{ m: InnerEmpty{} };
    }
}