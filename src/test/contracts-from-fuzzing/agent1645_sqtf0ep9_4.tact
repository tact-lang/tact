struct B {
    s: String;
    c: Cell;
    flag: Bool;
    intValue: Int;
}

contract MultiTypeStructContract {
    b: B;

    init() {
        self.b = B{ s: "abc", c: emptyCell(), flag: true, intValue: 10 };
    }
}