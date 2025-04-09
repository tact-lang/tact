// Wide nesting optional primitive chain inside struct
struct Chain {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
}

contract ChainHolder {
    data: Chain;

    init() {
        self.data = Chain{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}