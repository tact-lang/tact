// chain of single-field structs
struct F1 { x: Int; }
struct F2 { x: F1; }
struct F3 { x: F2; }
struct F4 { x: F3; }
struct F5 { x: F4; }
struct F6 { x: F5; }

contract ChainStructs {
    data: F6;

    init() {
        self.data = F6{
            x:F5{
                x:F4{
                    x:F3{
                        x:F2{
                            x:F1{x:42}
                        }
                    }
                }
            }
        };
    }
}