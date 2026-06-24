struct Chain4 {
    s1: Int; 
    s2: Bool?;
    s3: String;
    s4: Int?;
}

struct Chain3 {
    nxt: Chain4; 
    extra: Bool;
}

struct Chain2 {
    nxt: Chain3; 
    more: String?;
}

struct Chain1 {
    nxt: Chain2;
}

contract NestedChain4 {
    data: Chain1;

    init() {
        self.data = Chain1{
            nxt: Chain2{
                nxt: Chain3{
                    nxt: Chain4{
                        s1:1,
                        s2:null,
                        s3:"s",
                        s4:null
                    },
                    extra: true
                },
                more: null
            }
        };
    }
}
