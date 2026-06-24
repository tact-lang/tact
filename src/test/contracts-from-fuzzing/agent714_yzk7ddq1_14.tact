struct EmptyOpt {
    x: Int?;
    y: Bool?;
}

contract AllOptionals {
    vars: EmptyOpt;

    init() {
        self.vars = EmptyOpt{ x: null, y: null };
    }
}