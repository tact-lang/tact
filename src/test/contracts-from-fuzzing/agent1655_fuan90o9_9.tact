struct ManyOptionals {
    s: String?;
    i: Int?;
    b: Bool?;
    c: Cell?;
    a: Address?;
}

contract OptsState {
    st: ManyOptionals;

    init() {
        self.st = ManyOptionals{
            s: null, i: null, b: null, c: null, a: null
        };
    }
}