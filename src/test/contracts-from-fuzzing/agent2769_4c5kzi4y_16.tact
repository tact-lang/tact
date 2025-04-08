struct Chain {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
}

contract ChainFields {
    x: Chain;
    y: Chain;

    init() {
        self.x = Chain{a:1,b:null,c:"x",d:true};
        self.y = Chain{a:2,b:5,c:"y",d:false};
    }
}