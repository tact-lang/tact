struct InnerOne {
    flag: Bool;
}

struct InnerTwo {
    txt: String;
}

struct Outer {
    inner1: InnerOne;
    inner2: InnerTwo;
}

contract ComplexNested {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner1: InnerOne{flag:true},
            inner2: InnerTwo{txt: "hi"},
        };
    }
}