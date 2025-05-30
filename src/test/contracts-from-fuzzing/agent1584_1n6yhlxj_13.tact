struct Info {
    number: Int?;
    flag: Bool?;
}

contract TestContract {
    a: Int? = null;
    b: Bool?;
    c: Info? = null;
    d: Info?;

    init() {}

    receive() {
        self.a = 1;
        self.b = true;
        self.c = Info{ number: 2, flag: false };
        self.d = Info{ number: null, flag: null };
    }
}
