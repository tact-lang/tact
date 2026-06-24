struct Weird {
    s: String;
    n: Int?;
    b: Bool;
    optStr: String?;
    flag: Bool?;
}

contract NestedWeird {
    data: Weird;

    init() {
        self.data = Weird{
            s:"abc",
            n:null,
            b:true,
            optStr:null,
            flag:false
        };
    }
}
