struct StringMix {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringMixTest {
    data: StringMix = StringMix{ a:"hi", b:null, c:"bye", d:null };

    receive() {
        self.data = StringMix{ a:"hello", b:"foo", c:"world", d:"bar" };
    }
}