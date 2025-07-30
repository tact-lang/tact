struct Sub {
    flag: Bool = true;
    msg: String?;
}

struct Wrap {
    s: Sub;
    value: Int;
}

contract NestTest {
    inner: Wrap;

    init() {
        self.inner = Wrap{ s: Sub{ msg: "hello" }, value: 999 };
    }
}