struct Compose {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
}

contract ComposePersistent {
    f: Compose;

    init() {
        self.f = Compose{a:1,b:null,c:"abc",d:true};
    }
}