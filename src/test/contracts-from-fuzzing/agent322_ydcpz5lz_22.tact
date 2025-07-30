struct Layer4 {
    d1: Int;
    d2: Int;
    d3: Bool;
}
struct Layer3 {
    c1: Layer4;
    c2: Layer4;
    c3: Layer4;
}
struct Layer2 {
    b1: Layer3;
    b2: Layer3;
}
struct Layer1 {
    a1: Layer2;
    a2: Layer2;
}

contract Test {
    val: Layer1;

    init() {
        self.val = Layer1{
            a1: Layer2{
                b1: Layer3{
                    c1: Layer4{d1:1,d2:2,d3:true},
                    c2: Layer4{d1:3,d2:4,d3:false},
                    c3: Layer4{d1:5,d2:6,d3:true}
                },
                b2: Layer3{
                    c1: Layer4{d1:7,d2:8,d3:false},
                    c2: Layer4{d1:9,d2:10,d3:true},
                    c3: Layer4{d1:11,d2:12,d3:false}
                }
            },
            a2: Layer2{
                b1: Layer3{
                    c1: Layer4{d1:13,d2:14,d3:true},
                    c2: Layer4{d1:15,d2:16,d3:false},
                    c3: Layer4{d1:17,d2:18,d3:true}
                },
                b2: Layer3{
                    c1: Layer4{d1:19,d2:20,d3:false},
                    c2: Layer4{d1:21,d2:22,d3:true},
                    c3: Layer4{d1:23,d2:24,d3:false}
                }
            }
        };
    }
}