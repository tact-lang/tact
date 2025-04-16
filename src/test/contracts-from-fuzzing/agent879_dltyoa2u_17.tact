struct Combo {
    a: Int?;
    b: Bool;
    c: Slice?;
    d: Cell;
}

contract ComboStructTest {
    val: Combo;
    init() {
        self.val = Combo{
            a:null,
            b:true,
            c:null,
            d:emptyCell()
        };
    }
}
