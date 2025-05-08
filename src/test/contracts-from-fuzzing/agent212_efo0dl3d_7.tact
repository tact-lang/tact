struct Stuff {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    str: String = "start";
    s: Stuff;
    i: Int = 123;
    b: Bool = false;

    init() {
        self.s = Stuff{ x: 99, y: true, z: "inside" };
        self.i = 999;
        self.b = true;
        self.str = "done";
    }
}