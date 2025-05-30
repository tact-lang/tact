struct Stringy {
    s1: String = "";
    s2: String = "";
}

contract StringUpdate {
    texts: Stringy;

    init() {
        self.texts = Stringy{
            s1: "foo",
            s2: "bar"
        };
    }

    receive() {
        let _ = self.texts;
    }
}