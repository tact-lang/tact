struct Sub {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
}

contract DeepDefaults {
    nested: Sub = Sub{ a:1, b:null, c:false, d:null };
}