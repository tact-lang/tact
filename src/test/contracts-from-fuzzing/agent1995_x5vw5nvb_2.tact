struct Inner1 { a: Int; }
struct Inner2 { b: String; }
struct Composite {
    first: Inner1;
    second: Inner2;
    thirdStr: String;
    fourthNum: Int as uint64;
    optInner1: Inner1?;
}

contract ComposeStorage {
    val: Composite;

    init() {
        self.val = Composite{
            first: Inner1{a:1},
            second: Inner2{b:"hi"},
            thirdStr: "hello",
            fourthNum: 123,
            optInner1: null
        };
    }
}