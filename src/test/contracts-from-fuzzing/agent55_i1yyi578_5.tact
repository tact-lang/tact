struct DeepArray {
    s1: Composite;
    s2: Composite;
    s3: Composite;
    s4: Composite;
    s5: Composite;
}

struct Composite {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Address;
}

contract TestContract {
    storage: DeepArray;

    init() {
        self.storage = DeepArray{
            s1: Composite{a:1,b:true,c:null,d:emptyCell(),e:myAddress()},
            s2: Composite{a:2,b:false,c:null,d:emptyCell(),e:myAddress()},
            s3: Composite{a:3,b:true,c:null,d:emptyCell(),e:myAddress()},
            s4: Composite{a:4,b:false,c:null,d:emptyCell(),e:myAddress()},
            s5: Composite{a:5,b:true,c:null,d:emptyCell(),e:myAddress()},
        };
    }
}