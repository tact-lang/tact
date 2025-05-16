struct EmptyOpt {
    val: Int?;
}

contract NoInit {
    e: EmptyOpt;

    init() {
        self.e = EmptyOpt{val: null};
    }
}