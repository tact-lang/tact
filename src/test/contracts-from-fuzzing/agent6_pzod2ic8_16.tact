struct NS1 { s: String; }
struct NS2 { s: NS1; }
struct NS3 { s: NS2; }
struct NS4 { s: NS3; }
struct NS5 { s: NS4; }

contract VeryDeepStringNesting {
    data: NS5;
    init() {
        self.data = NS5{
            s: NS4{
                s: NS3{
                    s: NS2{
                        s: NS1{
                            s: "deep"
                        }
                    }
                }
            }
        };
    }
}