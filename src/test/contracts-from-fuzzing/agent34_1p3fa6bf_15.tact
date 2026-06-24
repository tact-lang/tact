message(1) Ping {
    id: Int;
}

contract Test14 {
    m: Ping?;
    init() {
        self.m = Ping{ id: 42 };
    }
}