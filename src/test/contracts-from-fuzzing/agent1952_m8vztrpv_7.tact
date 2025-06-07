struct MixOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    a: Address?;
}

contract TestContract {
    m: MixOptionals;

    init() {
        self.m = MixOptionals{
            i: null,
            b: true,
            s: null,
            c: emptyCell(),
            a: null,
        };
    }
}
