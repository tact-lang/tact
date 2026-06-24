struct BigNested {
    inner1: Inner1;
    inner2: Inner2;
    extra: Int;
}

struct Inner1 {
    a: Int;
    b: String;
}

struct Inner2 {
    flag: Bool;
    val: Int;
    text: String;
}

contract BigNestedTest {
    bn: BigNested;

    init() {
        self.bn = BigNested{
            inner1: Inner1{
                a: 5,
                b: "five",
            },
            inner2: Inner2{
                flag: true,
                val: 6,
                text: "six",
            },
            extra: 7,
        };
    }
}