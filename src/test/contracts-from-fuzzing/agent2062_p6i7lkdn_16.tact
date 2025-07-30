struct ManyDeepOptional {
    s1: Int?;
    s2: Int?;
    s3: Int?;
    s4: Int?;
    s5: Int?;
    s6: Int?;
    s7: Int?;
    s8: Int?;
    s9: Int?;
    s10: Int?;
}

contract MassiveOptional {
    nested: ManyDeepOptional?;
    init() { self.nested = null; }
}