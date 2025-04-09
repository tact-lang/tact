struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: Int?; // defaults to null
    d: Bool?; // defaults to null
}

contract DefFields {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }

    receive() {
        self.val = Defaulted{
            a: 42,
            b: true,
            c: 777,
            d: false,
        };
    }
}