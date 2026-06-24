struct VeryDeep1 { next: VeryDeep2 }
struct VeryDeep2 { next: VeryDeep3 }
struct VeryDeep3 { next: VeryDeep4 }
struct VeryDeep4 { next: VeryDeep5 }
struct VeryDeep5 { x: Int }

contract DeepPersistent {
    nest: VeryDeep1;

    init() {
        self.nest = VeryDeep1 {
            next: VeryDeep2 {
                next: VeryDeep3 {
                    next: VeryDeep4 {
                        next: VeryDeep5 { x: 999 }
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.nest.next.next.next.next.x;
    }
}