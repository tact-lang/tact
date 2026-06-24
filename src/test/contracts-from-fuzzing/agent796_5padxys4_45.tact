struct Combo {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}
contract ComboTest {
    field: Combo;
    init() {
        self.field = Combo{ a:1, b:null, c:2, d:null };
    }
}