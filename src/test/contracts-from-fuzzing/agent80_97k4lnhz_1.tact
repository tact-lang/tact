struct Nested {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
}

contract DeepFields {
    one: Nested;
    two: Int;
    three: Bool;
    four: Address;
    five: String;
    six: Cell;
    seven: Slice;
    eight: Int?;
    nine: Bool?;
    ten: Address?;

    init() {
        self.one = Nested{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
        };
        self.two = 2;
        self.three = false;
        self.four = myAddress();
        self.five = "hello";
        self.six = emptyCell();
        self.seven = emptyCell().asSlice();
        self.eight = null;
        self.nine = null;
        self.ten = null;
    }
}