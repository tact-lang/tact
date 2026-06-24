struct BigNested {
    a: Int;
    b: BigNested2;
    c: String;
}

struct BigNested2 {
    d: Int;
    e: Bool;
    f: BigNested3;
}

struct BigNested3 {
    g: Int;
    h: Bool;
    i: String;
}

contract BigNestedContract {
    val: BigNested;
    init() {
        self.val = BigNested{
            a: 1,
            b: BigNested2{
                d: 2,
                e: false,
                f: BigNested3{
                    g:3,h:true,i:"hi"
                }
            },
            c: "done"
        };
    }
}