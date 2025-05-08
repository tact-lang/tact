struct Many {
    a: Int; b: Bool; c: String;
    d: Int?; e: Bool?; f: String?;
}

contract ManyDefaults {
    m: Many = Many{
        a:1, b:true, c:"ok",
        d:null, e:false, f:null
    };
}