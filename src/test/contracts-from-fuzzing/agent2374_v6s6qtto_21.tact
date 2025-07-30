struct AS {
    a: Int;
    b: Bool;
}

struct BS {
    c: String;
    d: Int?;
}

struct CS {
    a: AS;
    b: BS;
    e: String?;
    f: Int;
}

contract NestDeeper {
    val: CS;

    init() {
        self.val = CS{
            a: AS{a:1,b:true},
            b: BS{c:"q",d:2},
            e: null,
            f: 5
        };
    }
}