struct Wrapper {
    s: String;
}

struct BigWrap {
    w1: Wrapper;
    w2: Wrapper;
    w3: Wrapper;
}

contract StringsStorage {
    data: BigWrap;
    init() {
        self.data = BigWrap{
            w1: Wrapper{s:"a"},
            w2: Wrapper{s:"b"},
            w3: Wrapper{s:"c"}
        };
    }
}