struct IntsAndBools {
    a: Int; b: Bool;
    c: Int; d: Bool;
    e: Int; f: Bool;
}

contract InterleavedFields {
    data: IntsAndBools;
    init() {
        self.data = IntsAndBools{
            a:1,b:true,c:2,d:false,e:3,f:true
        };
    }
}