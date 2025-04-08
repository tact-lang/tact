// purposely define a structurally very large nest with deep optional chains

struct Nested1 { x: Int?; }
struct Nested2 { x: Nested1?; }
struct Nested3 { x: Nested2?; }
struct Nested4 { x: Nested3?; }
struct Nested5 { x: Nested4?; }
struct Nested6 { x: Nested5?; }
struct Nested7 { x: Nested6?; }

contract HugeOptionalNest {
    val: Nested7;
    init() {
        self.val = Nested7{
            x: Nested6{
                x: Nested5{
                    x: Nested4{
                        x: Nested3{
                            x: Nested2{
                                x: Nested1{
                                    x: 31337
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}