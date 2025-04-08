struct Defaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    st: Defaults;

    init() {
        self.st = Defaults{}; // use all defaults
    }

    receive() {
        self.st = Defaults{ a: 42, b: false, c: "bye" };
    }
}