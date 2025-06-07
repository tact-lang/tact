struct HasStringOpt {
    title: String?;
    subtitle: String?;
}

contract Test {
    x: HasStringOpt;

    init() {
        self.x = HasStringOpt{title: "hi", subtitle: null};
    }
}