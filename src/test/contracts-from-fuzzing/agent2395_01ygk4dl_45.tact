struct NullCombo {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract NullComboTest {
    data: NullCombo;
    init() {
        self.data = NullCombo{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}
