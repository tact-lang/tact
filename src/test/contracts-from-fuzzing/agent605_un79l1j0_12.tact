struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
}

contract MixedHolder {
    x: MixedOptional;

    init() {
        self.x = MixedOptional{
            a: null,
            b: true,
            c: null,
            d: emptyCell()
        };
    }
}