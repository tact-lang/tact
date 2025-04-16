struct StructA {
    id: Int;
    val: Bool;
}

struct StructB {
    sa: StructA;
    name: String;
}

contract CrossRefLike {
    sa: StructA;
    sb: StructB;

    init() {
        self.sa = StructA{id:1,val:true};
        self.sb = StructB{sa:self.sa,name:"v"};
    }
}