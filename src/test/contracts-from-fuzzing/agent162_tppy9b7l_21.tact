struct HasStringOpt {
    text: String?;
}

struct Wrapper {
    content: HasStringOpt?;
}

contract OptOptWrapper {
    wrap: Wrapper;
    init() {
        self.wrap = Wrapper{
            content: HasStringOpt{
                text: "xyz",
            },
        };
    }
}