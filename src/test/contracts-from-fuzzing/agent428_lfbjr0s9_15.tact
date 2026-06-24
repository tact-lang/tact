struct Stuff {
    a: Int;
    b: String;
    c: Bool;
}

contract TestContract {
    x: Stuff;
    y: Stuff?;
    flag: Bool;

    init() {
        self.x = Stuff { a: 1, b: "hi", c: true };
        self.y = null;
        self.flag = false;
    }
}