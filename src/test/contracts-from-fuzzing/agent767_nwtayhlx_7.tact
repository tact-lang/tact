struct Inner {
    x: Int;
    flag: Bool;
}

struct Wrap {
    nested: Inner;
    text: String;
}

contract OptWrapTest {
    data: Wrap?;

    init() {
        self.data = Wrap{
            nested: Inner{
                x: 5,
                flag: true,
            },
            text: "ok"
        };
    }
}
