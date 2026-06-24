struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Fuzz9 {
    lol: Mix?;

    init() {
        self.lol = null;
    }
}