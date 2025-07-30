contract MultiStructs {
    a: StructA;
    b: StructB;
    c: StructC;

    init() {
        self.a = StructA{ x:1, y:"" };
        self.b = StructB{ flag:true, addr:myAddress() };
        self.c = StructC{ val:null };
    }
}

struct StructA {
    x: Int;
    y: String;
}

struct StructB {
    flag: Bool;
    addr: Address;
}

struct StructC {
    val: Int?;
}