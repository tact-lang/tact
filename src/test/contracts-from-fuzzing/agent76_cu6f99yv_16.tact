struct HasOpt {
    s: String?;
    i: Int?;
}

contract OptContract {
    data: HasOpt;
    init() {
        self.data = HasOpt{ s: null, i: null };
    }
}