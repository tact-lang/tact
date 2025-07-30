struct Deep {
    i: Int;
    s: String;
}

struct Wrapping {
    d: Deep;
    o: Int?;
}

contract PersistWrap {
    f: Wrapping;

    init() {
        self.f = Wrapping{
            d: Deep{i:1,s:"x"},
            o: null
        };
    }
}