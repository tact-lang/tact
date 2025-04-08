struct Inner {
    flag: Bool?;
    num: Int;
}

struct Outer {
    maybe: Inner?;
    label: String;
}

contract NestTest {
    data: Outer;

    init() {
        self.data = Outer{
            maybe: null,
            label: "hello"
        };
    }

    receive() {}
}