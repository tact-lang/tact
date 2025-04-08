struct LargeStruct {
    a1: Int; a2: Bool; a3: String;
    b1: Int?; b2: Bool?; b3: String?;
    c1: Int; c2: Bool; c3: String;
    d1: Int?; d2: Bool?; d3: String?;
    e1: Int; e2: Bool; e3: String;
    f1: Int?; f2: Bool?; f3: String?;
    g1: Int; g2: Bool; g3: String;
    h1: Int?; h2: Bool?; h3: String?;
}

contract LargeFields {
    big: LargeStruct = LargeStruct{
        a1:1,a2:true,a3:"a", b1:1,b2:true,b3:"b", c1:1,c2:true,c3:"c",
        d1:1,d2:true,d3:"d", e1:1,e2:true,e3:"e", f1:1,f2:true,f3:"f",
        g1:1,g2:true,g3:"g", h1:1,h2:true,h3:"h"
    };

    init() {
        self.big = self.big;
    }

    receive() {
        let _ = self.big;
    }
}