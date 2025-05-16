message(0xAAA) Info {
    kind: Int;
}

struct Meta {
    tag: String;
    info: Info;
}

contract TestContract {
    m: Meta;

    init() {
        self.m = Meta{
            tag: "t",
            info: Info{ kind: 3 },
        };
    }

    receive() {}
}