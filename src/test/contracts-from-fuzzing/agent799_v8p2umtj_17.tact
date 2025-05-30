struct StrInt {
    s: String;
    i: Int;
}

contract StringAndInt {
    f: StrInt;

    init() {
        self.f = StrInt{s:"abc", i:42};
    }
}