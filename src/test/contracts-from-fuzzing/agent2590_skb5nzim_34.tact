struct AlternatingOptionals {
    a: Int?;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int?;
}

contract AltOptionalsContract {
    state: AlternatingOptionals;
    init() {
        self.state = AlternatingOptionals{ a:null, b:true, c:null, d:false, e:null };
    }
}