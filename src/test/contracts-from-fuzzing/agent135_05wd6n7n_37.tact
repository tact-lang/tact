struct EmptyTail {
    a: Int;
    b: String;
    c: Bool;
}

struct TailWrap {
    x: Int;
    t: EmptyTail;
}

contract TailContract {
    wrap: TailWrap;

    init() {
        self.wrap = TailWrap{
            x:1,
            t: EmptyTail{
                a:2,
                b:"b",
                c:true
            }
        };
    }
}
