struct OptionalDeeply {
    deepOpt: Int?;
    deepOpt2: String?;
}

struct Container {
    content: OptionalDeeply;
    note: String;
}

contract UseContainer {
    data: Container;
    init() {
        self.data = Container{
            content: OptionalDeeply{ deepOpt: null, deepOpt2: "ok" },
            note: "hello"
        };
    }
}