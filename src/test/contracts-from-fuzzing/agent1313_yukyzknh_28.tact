struct NS1 { v: Int; }
struct NS2 { v: NS1; }
struct NS3 { v: NS2; }
struct NS4 { v: NS3; }
struct NS5 { v: NS4; }

contract VeryDeepStruct {
    data: NS5;

    init() {
        self.data = NS5{
            v: NS4{
                v: NS3{
                    v: NS2{
                        v: NS1{v: 321}
                    }
                }
            }
        };
    }
}