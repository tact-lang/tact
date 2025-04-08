struct NullableComplex {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract NullableCombo {
    val: NullableComplex;

    init() {
        self.val = NullableComplex{a:null,b:null,c:null,d:null,e:null};
    }
}