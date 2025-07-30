struct Depth1 { next: Depth2; }
struct Depth2 { next: Depth3; }
struct Depth3 { next: Depth4; }
struct Depth4 { next: Depth5; }
struct Depth5 { val: Int; }

contract FiveLevelNest {
    f: Depth1;
    init() {
        self.f = Depth1{
            next: Depth2{
                next: Depth3{
                    next: Depth4{
                        next: Depth5{ val:123 }
                    }
                }
            }
        };
    }
}
