contract BigOptionalStruct {
    data: BigStruct?;

    init() {
        self.data = null;
    }
}

struct BigStruct {
    a: Int; b: Bool; c: String;
    d: Int; e: Bool; f: String;
    g: Int; h: Bool; i: String;
    j: Int; k: Bool; l: String;
    m: Int; n: Bool; o: String;
}