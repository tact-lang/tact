struct HasStringOpt {
    s: String?;
}

contract Test30 {
    data: HasStringOpt;

    init() {
        self.data = HasStringOpt{ s: null };
    }
}