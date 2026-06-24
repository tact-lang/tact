struct DeepInner { z: Int }

struct MidInner { x: Int; y: DeepInner }

struct Outer { b: Bool; m: MidInner }

contract TestContract {
    complexData: Outer;

    init() {
        self.complexData = Outer{
            b: true,
            m: MidInner{
                x: 42,
                y: DeepInner{ z: 100 }
            }
        };
    }
}