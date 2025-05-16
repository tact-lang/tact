struct X1 { x: Int }
struct X2 { x1: X1 }
struct X3 { x2: X2 }
struct X4 { x3: X3 }
struct X5 { x4: X4 }
struct X6 { x5: X5 }
struct X7 { x6: X6 }
struct X8 { x7: X7 }

contract DeepNest {
    field: X8;

    init() {
        self.field = X8{
            x7: X7{
                x6: X6{
                    x5: X5{
                        x4: X4{
                            x3: X3{
                                x2: X2{
                                    x1: X1{ x: 123 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}