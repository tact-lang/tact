struct S {
    s1: Int; s2: Bool; s3: String; s4: Cell; s5: Slice;
    s6: Address; s7: Bool?; s8: Int?; s9: String?; s10: Cell?;
}

contract ManyTypes {
    st: S;
    
    init() {
        self.st = S{
            s1:1, s2:true, s3:"x", s4:emptyCell(), s5:emptyCell().asSlice(),
            s6:myAddress(), s7:null, s8:null, s9:null, s10:null
        };
    }
}