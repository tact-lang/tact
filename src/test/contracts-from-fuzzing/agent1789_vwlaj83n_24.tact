struct SomeCombo {
    a: Int?;
    b: Bool;
    c: String?;
}

contract DefaultNestedInit {
    combo: SomeCombo = SomeCombo{ a:null, b:true, c:null };
}