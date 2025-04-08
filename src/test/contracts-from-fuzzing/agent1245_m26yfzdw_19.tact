struct Flat {
    a: Int;
    b: Bool;
    c: String;
}

contract JustFlat {
    data: Flat;

    init() {
        self.data = Flat{
            a: 5,
            b: true,
            c: "flat",
        };
    }
}
