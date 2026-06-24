struct Opts1 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Opts2 {
    d: Int;
    e: Opts1;
    f: Bool?;
    g: String?;
}

contract NestedOptions {
    st: Opts2;

    init() {
        self.st = Opts2{
            d: 42,
            e: Opts1{a:null,b:true,c:null},
            f: null,
            g: "hi",
        };
    }
}
