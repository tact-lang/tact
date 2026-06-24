struct Flat {
    a: Int;
    b: Bool;
    c: String;
}

contract FlatTwice {
    x: Flat;
    y: Flat;

    init() {
        self.x = Flat{
            a: 1,
            b: true,
            c: "x"
        };
        self.y = Flat{
            a: 2,
            b: false,
            c: "y"
        };
    }
}