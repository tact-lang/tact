struct StructLarge {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool;
    f: Int;
    g: Bool;
    h: String;
}

contract ComplexStructStorage {
    s: StructLarge;

    init() {
        self.s = StructLarge{
            a:1,b:true,c:"abc",d:myAddress(),e:false,
            f:2,g:true,h:"def"
        };
    }
}
