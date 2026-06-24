struct Info {
    count: Int;
    flag: Bool;
}

contract TestContract {
    a: Info?;
    b: Info?;
    init() {
        self.a = null;
        self.b = Info{ count: 1, flag: true };
    }
}