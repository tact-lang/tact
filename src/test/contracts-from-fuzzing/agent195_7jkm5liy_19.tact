struct S {
    f1: Int;
    f2: Bool;
    f3: String;
    fo1: Int?;
    fo2: Bool?;
    fo3: String?;
}

struct T {
    a: S;
    b: S;
    c: S;
}

contract NestedMany {
    contents: T;

    init() {
        self.contents = T{
            a: S{ f1:1, f2:true, f3: "a", fo1:null, fo2:null, fo3:null },
            b: S{ f1:2, f2:false, f3: "b", fo1:7, fo2:true, fo3:null },
            c: S{ f1:3, f2:true, f3: "c", fo1:null, fo2:false, fo3:"opt" }
        };
    }
}
