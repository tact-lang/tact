struct Chain1 { a: Int; }
struct Chain2 { c1: Chain1; b: Int?; }
struct Chain3 { c2: Chain2; flag: Bool; }
struct Chain4 { c3: Chain3; x: Int; }

contract ChainStorage {
    data: Chain4;
    
    init() {
        self.data = Chain4{
            c3: Chain3{
                c2: Chain2{
                    c1: Chain1{ a:0 },
                    b: null
                },
                flag:true
            },
            x:1
        };
    }
}
