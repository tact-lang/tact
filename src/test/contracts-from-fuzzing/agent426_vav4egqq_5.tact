struct VeryDeep1 { next: VeryDeep2; }
struct VeryDeep2 { next: VeryDeep3; }
struct VeryDeep3 { next: VeryDeep4; }
struct VeryDeep4 { next: VeryDeep5; }
struct VeryDeep5 { leaf: Int; }

contract TestContract {
    root: VeryDeep1;

    init() {
        self.root = VeryDeep1{
            next: VeryDeep2{
                next: VeryDeep3{
                    next: VeryDeep4{
                        next: VeryDeep5{ leaf: 42 }
                    }
                }
            }
        };
    }
}