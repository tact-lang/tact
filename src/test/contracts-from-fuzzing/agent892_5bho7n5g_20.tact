struct S1 {
    a: Bool;
    b: Int;
    c: Int?;
}

struct S2 {
    d: S1;
    e: Bool?;
    f: String;
}

contract DeepOptional {
    opt: S2?;

    init() {
        self.opt = S2{
            d: S1{a:true,b:42,c:null},
            e: false,
            f: "end"
        };
    }
}