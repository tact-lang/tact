struct Mix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract CombinedFields {
    m: Mix;
    init() {
        self.m = Mix{ a:1, b:true, c:null, d:null, e:"ok", f:null };
    }
}