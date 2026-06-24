struct WithString {
    name: String;
    description: String?;
}

struct WithFlag {
    ready: Bool;
    info: WithString;
}

contract StringNestedOpt {
    data: WithFlag;

    init() {
        self.data = WithFlag{
            ready: true,
            info: WithString{name: "abc", description: null},
        };
    }
}