struct S {
    a: Int;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract ContractS {
    data: S;

    init() {
        self.data = S{
            a:1,
            b:null,
            c:null,
            d:2,
            e:true,
            f:"hi"
        };
    }

    receive() {}
}