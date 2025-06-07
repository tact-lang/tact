struct InnerA {
    fa: Int;
}

struct InnerB {
    fb: Bool;
}

struct Container {
    a: InnerA;
    b: InnerB;
    maybeInt: Int?;
    text: String;
}

contract MixNested {
    c: Container;

    init() {
        self.c = Container{
            a: InnerA{fa:1},
            b: InnerB{fb:true},
            maybeInt:null,
            text:"hi"
        };
    }
}
