struct S {
    a: Int; 
    b: Bool;
}

contract LargeAmountOfStructs {
    s1: S; s2: S; s3: S; s4: S; s5: S; s6: S; s7: S; s8: S;

    init() {
        let v = S{ a: 1, b: true };
        self.s1=v; self.s2=v; self.s3=v; self.s4=v;
        self.s5=v; self.s6=v; self.s7=v; self.s8=v;
    }
}