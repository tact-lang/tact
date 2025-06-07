struct Paul {
    a: Int as uint64;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestingCombo {
    state: Paul;

    init() {
        self.state = Paul{
            a:12345, b:true, c:"hey", d:null, e:null, f:"ok"
        };
    }
}