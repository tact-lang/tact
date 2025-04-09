struct StrMix {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringMix {
    data: StrMix;

    init() {
        self.data = StrMix{
            a:"a", b:null, c:"c", d:"d"
        };
    }
}