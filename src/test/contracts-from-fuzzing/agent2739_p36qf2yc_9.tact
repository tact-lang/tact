struct MultipleOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
}

contract TestContract {
    data: MultipleOptionals;
    init() {
        self.data = MultipleOptionals{
            i: null,
            b: null,
            s: null,
            c: null,
            sl: null,
            a: null
        };
    }
}