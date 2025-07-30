struct VeryDeep1 { a: Int }
struct VeryDeep2 { x: VeryDeep1 }
struct VeryDeep3 { y: VeryDeep2 }
struct VeryDeep4 { z: VeryDeep3 }

contract DeepestContract {
    f: VeryDeep4;

    init() {
        self.f = VeryDeep4 {
            z: VeryDeep3 {
                y: VeryDeep2 {
                    x: VeryDeep1 { a: 999 }
                }
            }
        };
    }
}
