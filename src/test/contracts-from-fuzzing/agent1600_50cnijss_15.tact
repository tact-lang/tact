message(0x42) InnerMsg {
    foo: Int;
}

struct Wrapper {
    content: InnerMsg;
    done: Bool;
}

contract TestContract {
    storage: Wrapper?;

    init() {
        self.storage = null;
    }
}