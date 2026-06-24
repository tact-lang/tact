// optional inside nested struct field
struct DeepOpt {
    x: Int?;
    y: Bool;
}

struct Container {
    embedded: DeepOpt;
    msg: String;
}

contract OptionalInNested {
    val: Container;
    init() {
        self.val = Container{
            embedded: DeepOpt{ x: null, y: true },
            msg: "hi",
        };
    }
}