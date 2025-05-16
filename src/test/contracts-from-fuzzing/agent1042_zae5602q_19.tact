struct OnlyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalStruct {
    f: OnlyOptional = OnlyOptional{a:null, b:null, c:null};
}