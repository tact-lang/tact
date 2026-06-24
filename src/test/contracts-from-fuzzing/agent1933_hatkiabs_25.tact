struct Compose {
    a: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract FieldOrder {
    f1: Compose;
    f2: Compose;

    init() {
        self.f1 = Compose{ a:1,b:true,s:"hi",o:null };
        self.f2 = Compose{ a:2,b:false,s:"bye",o:10 };
    }
}