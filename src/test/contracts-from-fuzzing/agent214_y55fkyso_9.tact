struct A { x: Int }
struct B { y: A }
struct C { z: B }
struct D { w: C }
struct E { q: D }
struct F { u: E }

contract VeryDeepNest {
    val: F;
    
    init() {
        self.val = F{
            u: E{
                q: D{
                    w: C{
                        z: B{
                            y: A{
                                x: 1
                            }
                        }
                    }
                }
            }
        };
    }
}
