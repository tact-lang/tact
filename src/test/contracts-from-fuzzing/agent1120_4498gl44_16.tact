struct ABC {
    a: Int; b: Bool; c: String;
}

contract SetFields {
    s: ABC;
    init() {
        self.s = ABC{a:1,b:true,c:"hi"};
    }
}