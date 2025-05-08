struct Mixed {
    a: Int = 1;
    b: Bool = true;
    c: String?; // optional with implicit null
    d: Int?; // optional null
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            b: false,
            d: 42,
        };
    }

    receive() {}
}