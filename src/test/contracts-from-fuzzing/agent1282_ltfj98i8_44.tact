// test giant deep nested struct with various optional and ser and defaults
struct L0 { a: Int = 5; b: Bool? = null; }
struct L1 { x: L0; y: L0; }
struct L2 { x: L1; y: L1; }
struct L3 { x: L2; y: L2; }
struct L4 { x: L3; y: L3; }

contract GiantDeepNest {
    val: L4;

    init() {
        self.val = L4{
            x:L3{
                x:L2{
                    x:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} },
                    y:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} }
                },
                y:L2{
                    x:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} },
                    y:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} }
                }
            },
            y:L3{
                x:L2{
                    x:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} },
                    y:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} }
                },
                y:L2{
                    x:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} },
                    y:L1{ x:L0{a:5,b:null}, y:L0{a:5,b:null} }
                }
            }
        };
    }
}