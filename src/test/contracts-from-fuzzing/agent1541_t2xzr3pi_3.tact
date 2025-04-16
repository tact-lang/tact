struct Inner {
    flag: Bool;
    num: Int;
}

struct Outer {
    embedded: Inner;
    text: String;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            embedded: Inner{
                flag: true,
                num: 5,
            },
            text: "start",
        };
    }

    receive() {
        self.data.embedded.num = self.data.embedded.num + 1;
    }
}