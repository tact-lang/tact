struct InnerMost { a: Int; b: Bool; }
struct Mid { x: InnerMost; y: InnerMost; }
struct OuterMost { left: Mid; right: Mid; }

contract DoubleNested {
    storage: OuterMost;

    init() {
        self.storage = OuterMost{
            left: Mid{ x: InnerMost{a:1,b:true}, y: InnerMost{a:2,b:false} },
            right: Mid{ x: InnerMost{a:3,b:true}, y: InnerMost{a:4,b:false} }
        };
    }
}