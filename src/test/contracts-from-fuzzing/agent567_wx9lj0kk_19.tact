// Flat contract persistent vars mix bool, int, string, optional nested struct
struct Tiny {
    val: Int = 42;
    text: String?;
}

contract Mix {
    one: Bool = false;
    two: Int = 0;
    three: Bool?;
    four: Int?;
    five: String?;
    six: Tiny?;

    init() {
        self.one = true;
        self.two = 100;
        self.three = null;
        self.four = null;
        self.five = null;
        self.six = Tiny{val:777, text:null};
    }
}
