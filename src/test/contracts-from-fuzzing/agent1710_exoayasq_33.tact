struct Emb {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    arr0: Emb;
    arr1: Emb;
    arr2: Emb;

    init() {
        self.arr0 = Emb{ a:1,b:true,c:"hi" };
        self.arr1 = Emb{ a:2,b:false,c:"bye" };
        self.arr2 = Emb{ a:3,b:true,c:"yo" };
    }
}