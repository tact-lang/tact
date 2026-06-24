struct FullOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructDefault {
    rec: FullOptional = FullOptional{ a:null, b:null, c:null };
}