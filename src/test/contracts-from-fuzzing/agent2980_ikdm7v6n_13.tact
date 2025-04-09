struct Chain {
    link1: Bool;
    link2: Int?;
    link3: Bool?;
    link4: String?;
    link5: Int as uint8;
    link6: String;
}

contract Test {
    c: Chain;

    init() {
        self.c = Chain{
            link1:true,
            link2:null,
            link3:null,
            link4:null,
            link5:12,
            link6:"end",
        };
    }
}