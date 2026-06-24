struct LongTuple {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Bool; g: Bool; h: String; i: Address; j: Bool;
}

contract HugeStructPersist {
    storage: LongTuple;

    init() {
        self.storage = LongTuple{
            a:1,b:2,c:3,d:4,e:5,f:true,g:false,h:"x",i:myAddress(),j:true
        };
    }
}