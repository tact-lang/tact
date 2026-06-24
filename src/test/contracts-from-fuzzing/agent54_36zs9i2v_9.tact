struct Deep1 { 
    v: Int; 
    opt: Bool?;
}
struct Deep2 {
    nested: Deep1;
    flag: Bool;
}
struct Deep3 {
    nested: Deep2;
    n: Int?;
}

contract Deeply {
    root: Deep3;

    init() {
        self.root = Deep3{
            nested: Deep2{
                nested: Deep1{v:42, opt:null},
                flag:true
            },
            n:null
        };
    }
}