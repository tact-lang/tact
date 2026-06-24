message(0xDEADBEEF) InnerMsg { foo: Int; }

struct Wrap {
    m: InnerMsg?;
    b: Bool;
}

contract TestContract {
    data: Wrap;

    init() {
        self.data = Wrap{m: null, b: true};
    }
}