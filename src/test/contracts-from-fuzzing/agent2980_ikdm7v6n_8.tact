struct Sub {
    num: Int as int64;
    text: String;
}

struct Holder {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
}

contract Test {
    data: Holder;

    init() {
        self.data = Holder{
            sub1: Sub{num:1, text:"a"},
            sub2: Sub{num:2, text:"b"},
            sub3: Sub{num:3, text:"c"},
        };
    }
}