struct Inner1 { a: Int; }
struct Inner2 { b: String; }
struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct BigStruct {
    m: Middle;
    optionalInner: Inner2?;
    num: Int;
}

contract BigStructContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            m: Middle{ i1: Inner1{a: 10}, i2: Inner2{b: "str"} },
            optionalInner: null,
            num: 42
        };
    }
}