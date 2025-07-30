struct VeryDeep1 { a: Int }
struct VeryDeep2 { b: VeryDeep1 }
struct VeryDeep3 { c: VeryDeep2 }
struct VeryDeep4 { d: VeryDeep3 }
struct VeryDeep5 { e: VeryDeep4 }

contract DeepestNest {
    val: VeryDeep5;

    init() {
        self.val = VeryDeep5{
            e: VeryDeep4{
                d: VeryDeep3{
                    c: VeryDeep2{
                        b: VeryDeep1{
                            a: 1,
                        },
                    },
                },
            },
        };
    }
}
