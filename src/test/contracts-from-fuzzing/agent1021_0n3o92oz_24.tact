struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedOptionalContract {
    val: S;

    init() {
        self.val = S{
            a:1,b:null,c:true,d:null,e:"x",f:null
        };
    }
}