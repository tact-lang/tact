struct TextData {
    a: String;
    b: String?;
    c: String;
    d: String?;
    e: String;
    f: String?;
}

contract Test {
    t: TextData;

    init() {
        self.t = TextData{
            a:"a", b:null, c:"c", d:null, e:"e", f:null
        };
    }
}