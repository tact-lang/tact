// Contract with large number of nested structs
struct N0 { val: Int; }
struct N1 { n0: N0; }
struct N2 { n1: N1; }
struct N3 { n2: N2; }
struct N4 { n3: N3; }
struct N5 { n4: N4; }

contract DeepStructsManyLevels {
    data: N5;

    init() {
        self.data = N5{
            n4: N4{
                n3: N3{
                    n2: N2{
                        n1: N1{
                            n0: N0{ val: 100 }
                        }
                    }
                }
            }
        };
    }
}