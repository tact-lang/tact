struct Combining {
    inner1: Int;
    inner2: Int?;
    inner3: String;
    inner4: String?;
}

contract CombineOptRegular {
    f: Combining;

    init() {
        self.f = Combining{
            inner1:10,
            inner2:null,
            inner3:"hi",
            inner4:null
        };
    }
}
