struct InnerMost { val: Int; }

struct Mid { inner: InnerMost; flag: Bool; text: String; }

struct Outer {
    mid: Mid;
    maybeAddr: Address?;
    someCell: Cell?;
}

contract ComplexNested {
    config: Outer;
    init() {
        self.config = Outer{
            mid: Mid{
                inner: InnerMost{ val: 100 },
                flag: true,
                text: "world"
            },
            maybeAddr: null,
            someCell: null
        };
    }
}