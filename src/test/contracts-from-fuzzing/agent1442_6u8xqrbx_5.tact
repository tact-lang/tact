struct Mid {
    a: Int;
    b: Bool;
}

struct Root {
    id: Int;
    child: Mid;
    flag: Bool;
    opt: Int?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            id:1, child:Mid{a:2,b:true}, flag:false, opt:null
        };
    }
}