struct InnerMost { x: Int; y: Bool; }
struct Inner { im: InnerMost; z: Bool; }
struct Outer { inr: Inner; w: Bool; }

contract Compose {
    val1: Outer;
    val2: Outer;

    init() {
        self.val1 = Outer{
            inr: Inner{ im: InnerMost{x:1,y:true}, z:false },
            w: true
        };
        self.val2 = Outer{
            inr: Inner{ im: InnerMost{x:2,y:false}, z:true },
            w: false
        };
    }
}