struct S {
    a: Int; b: Bool; c: String; d: Address; e: Int?; f: String?;
}

contract Everything {
    s: S;
    init() {
        self.s = S{a:1,b:true,c:"abc",d:myAddress(),e:null,f:null};
    }
}