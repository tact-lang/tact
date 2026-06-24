struct Defaults {
    a: Int = 99;
    b: Bool = false;
    c: String = "hi";
}

contract TestContract {
    d: Defaults;

    init() {
        self.d = Defaults{ a: 7, b: true, c: "bye" };
    }
}