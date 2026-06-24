struct Deep {
    a: Int;
    b: String;
}

struct Higher {
    d: Deep;
}

struct Top {
    h: Higher;
}

contract TopLevelNested {
    payload: Top;

    init() {
        self.payload = Top{
            h: Higher{
                d: Deep{ a: 99, b: "nested" }
            }
        };
    }
}