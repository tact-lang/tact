message(0x12) Simple { x: Int }

struct Wrap {
    s: Simple?;
}

contract OptionalMessageTest {
    data: Wrap;

    init() {
        self.data = Wrap{ s: null };
    }
}
