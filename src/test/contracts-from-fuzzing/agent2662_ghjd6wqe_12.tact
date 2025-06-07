struct Combo {
    a: Int;
    b: String?;
    c: Bool?;
    d: Cell;
}

struct Wrap1 {
    x: Combo;
}

struct Wrap2 {
    y: Wrap1;
}

contract ComboWrap {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            y: Wrap1{
                x: Combo{
                    a: 1,
                    b: null,
                    c: true,
                    d: emptyCell(),
                },
            },
        };
    }
}