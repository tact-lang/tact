struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: Bool?;
}

contract TestContract {
    d: Defaults;

    init() {
        self.d = Defaults{a: 10, b: false, c: null};
    }
}