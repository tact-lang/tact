struct MidOpt {
    a: Int;
    b: Bool?;
    c: String;
}

contract MidOptFields {
    stored: MidOpt;
    init() {
        self.stored = MidOpt{
            a:1,
            b:null,
            c:"hi"
        };
    }
}