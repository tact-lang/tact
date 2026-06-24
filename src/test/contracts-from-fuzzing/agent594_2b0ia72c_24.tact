struct InnerString {
    s: String = "";
}

struct OuterStr {
    inner: InnerString;
}

contract Test24 {
    o: OuterStr;

    init() {
        self.o = OuterStr{
            inner: InnerString{},
        };
    }

    receive() {}
}