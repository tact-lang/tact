struct InnerMost { z: Int }
struct MidLevel { y: InnerMost }
struct OuterWrap { x: MidLevel }

contract DeepStructDefaultVal {
    s: OuterWrap;
    init() {
        self.s = OuterWrap{ x: MidLevel{ y: InnerMost{ z: 777 } } };
    }
}