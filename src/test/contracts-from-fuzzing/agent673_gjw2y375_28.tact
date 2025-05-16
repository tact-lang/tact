struct L4 { a: Int; b: Bool; }
struct L3 { a: L4; b: L4; }
struct L2 { a: L3; b: L3; }
struct L1 { a: L2; b: L2; }

contract TestContract {
    val: L1;

    init() {
        self.val = L1{
            a: L2{
                a: L3{
                    a: L4{a:1,b:true},
                    b: L4{a:2,b:false}
                },
                b: L3{
                    a: L4{a:3,b:true},
                    b: L4{a:4,b:false}
                }
            },
            b: L2{
                a: L3{
                    a: L4{a:5,b:true},
                    b: L4{a:6,b:false}
                },
                b: L3{
                    a: L4{a:7,b:true},
                    b: L4{a:8,b:false}
                }
            }
        };
    }
}