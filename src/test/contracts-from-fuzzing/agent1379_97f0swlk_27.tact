struct Repeated {
    x: Int;
    y: String;
}

contract SameStructTwice {
    a: Repeated;
    b: Repeated;

    init() {
        let temp = Repeated{ x: 5, y: "foo" };
        self.a = temp;
        self.b = temp;
    }
}
