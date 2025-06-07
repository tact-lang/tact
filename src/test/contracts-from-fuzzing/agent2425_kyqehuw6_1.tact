struct Small {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: Small;
    init() {
        self.data = Small{ a: 1, b: true, c: "ok" };
    }
}