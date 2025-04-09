struct HasFields {
    a: Int;
    b: Bool;
    c: String?;
}

contract OptionalStructDefault {
    s: HasFields? = null;

    init() {
        self.s = HasFields{ a:1, b:true, c:"hi" };
    }
}