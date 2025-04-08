struct DefaultedOpt {
    a: Int?;
    b: Bool?;
}

contract DefaultsNested {
    opt: DefaultedOpt = DefaultedOpt{ a:null, b:null };
}