struct LargeNesting {
    a: Int;
    b: Bool;
    c: String;
    d: Inner;
    e: Inner;
    f: Inner;
    g: Inner;
    h: Inner;
    i: Inner;
    j: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    val: LargeNesting;

    init() {
        self.val = LargeNesting{
            a: 1,
            b: true,
            c: "hi",
            d: Inner{a:2,b:false,c:"a"},
            e: Inner{a:3,b:true,c:"b"},
            f: Inner{a:4,b:false,c:"c"},
            g: Inner{a:5,b:true,c:"d"},
            h: Inner{a:6,b:false,c:"e"},
            i: Inner{a:7,b:true,c:"f"},
            j: Inner{a:8,b:false,c:"g"}
        };
    }
}