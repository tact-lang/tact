struct Combo {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Address?;
}

contract OptionalMix {
    state: Combo;

    init() {
        self.state = Combo{
            a:1,
            b:true,
            c:null,
            d:emptyCell(),
            e:null
        };
    }
}
