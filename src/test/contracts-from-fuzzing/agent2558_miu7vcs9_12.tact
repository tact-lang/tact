struct EmptyOpt {
    v: Int?;
}

contract NullInit {
    x: EmptyOpt;

    init() {
        self.x = EmptyOpt{v: null};
    }
}