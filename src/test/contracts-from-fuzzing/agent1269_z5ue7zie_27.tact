struct Param {
    a: Int?;
    b: Bool;
    c: String;
}

contract TestContract {
    p1: Param;
    p2: Param;

    init() {
        self.p1 = Param{a: null, b: true, c: "one"};
        self.p2 = Param{a: 5, b: false, c: "two"};
    }
}