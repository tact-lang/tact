struct Mixed {
    a: String;
    b: Bool;
    c: Int?;
}

contract TestContract {
    state: Mixed;

    init() {
        self.state = Mixed{ a: "test", b: true, c: null };
    }
}