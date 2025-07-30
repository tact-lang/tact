struct MixTypes {
    i: Int;
    s: String;
    b: Bool;
}

struct MixOpts {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract TestMixes {
    a: MixTypes = MixTypes{i:1, s:"s", b:true};
    b: MixOpts = MixOpts{i:null, s:null, b:null};

    init() {
        self.a.i=5;
        self.b.i=42;
    }
}
