struct Base {
    flag: Bool;
    number: Int;
}

struct Container {
    b1: Base;
    b2: Base?;
    txt: String?;
}

contract MixTypes {
    field: Container;

    init() {
        self.field = Container{
            b1: Base{flag:true, number:1},
            b2: null,
            txt: null
        };
    }
}