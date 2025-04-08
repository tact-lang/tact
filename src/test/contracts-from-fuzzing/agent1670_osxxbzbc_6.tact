struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract UseNestedOptionals {
    state1: NestedOptionals;
    state2: NestedOptionals;

    init() {
        self.state1 = NestedOptionals { a:null, b:true, c:null, d:null };
        self.state2 = NestedOptionals { a:42, b:null, c:"hi", d:emptyCell() };
    }
}