struct DeepMany {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Composition1 {
    f1: DeepMany;
    f2: DeepMany;
}

struct Composition2 {
    c1: Composition1;
    c2: Composition1;
}

contract TestContract {
    field: Composition2;

    init() {
        self.field = Composition2{
            c1: Composition1{
                f1: DeepMany{ a:1, b:true, c:"a", d:null, e:null, f:null },
                f2: DeepMany{ a:2, b:false, c:"b", d:null, e:null, f:null }
            },
            c2: Composition1{
                f1: DeepMany{ a:3, b:true, c:"c", d:null, e:null, f:null },
                f2: DeepMany{ a:4, b:false, c:"d", d:null, e:null, f:null }
            }
        };
    }
}