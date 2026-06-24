struct RecursiveLayer2 {
    n: Int;
    flag: Bool?;
}

struct RecursiveLayer1 {
    r2a: RecursiveLayer2;
    r2b: RecursiveLayer2;
}

struct RecursiveRoot {
    r1a: RecursiveLayer1;
    r1b: RecursiveLayer1;
}

contract DeepRecursiveStruct {
    root: RecursiveRoot;

    init() {
        self.root = RecursiveRoot{
            r1a: RecursiveLayer1{
                r2a: RecursiveLayer2{n:1,flag:null},
                r2b: RecursiveLayer2{n:2,flag:true}
            },
            r1b: RecursiveLayer1{
                r2a: RecursiveLayer2{n:3,flag:false},
                r2b: RecursiveLayer2{n:4,flag:null}
            }
        };
    }
}