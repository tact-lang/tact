// deeply nested optionals chain in struct fields
struct DeepOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}
contract DeepOptionChainStorage {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null
        };
    }

    receive() {
        let v = self.val;
    }
}