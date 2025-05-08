struct Reordered {
    b: Int;
    a: Int;
    d: Int;
    c: Int;
}

contract OrderMatters {
    o: Reordered;

    init() {
        self.o = Reordered{
            b: 1,
            a: 2,
            d: 3,
            c: 4
        };
    }
}