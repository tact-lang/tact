struct ManyStr {
    a: String; b: String; c: String; d: String; e: String;
}

contract StringFields {
    s: ManyStr;

    init() {
        self.s = ManyStr{
            a:"a", b:"b", c:"c", d:"d", e:"e"
        };
    }
}