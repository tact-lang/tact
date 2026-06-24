struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OnlyDefaults {
    f: SOpt = SOpt{ a:null, b:null, c:null };
}