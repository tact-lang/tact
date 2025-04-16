struct DeepNested {
    a: Int = 1;
    b: Bool = true;
}

struct Wrap {
    inner: DeepNested = DeepNested{};
    msg: String = "hi";
}

contract NestStructContract {
    data: Wrap = Wrap{};

    receive() {
        self.data = Wrap{
            inner: DeepNested{a: 100, b: false},
            msg: "changed",
        };
    }
}