struct StringNest {
    text1: String;
    text2: String;
    text3: String;
}

struct Wrap {
    inner: StringNest;
    number: Int;
}

contract TestContract {
    storage: Wrap;

    init() {
        self.storage = Wrap{
            inner: StringNest{text1:"one", text2:"two", text3:"three"},
            number: 5
        };
    }
}