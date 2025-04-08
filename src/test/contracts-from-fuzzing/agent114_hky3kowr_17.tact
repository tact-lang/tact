struct MegaDeep4 { val: Int; }
struct MegaDeep3 { nest: MegaDeep4; }
struct MegaDeep2 { nest: MegaDeep3; }
struct MegaDeep1 { nest: MegaDeep2; }

contract MegaDeepContract {
    deep: MegaDeep1;

    init() {
        self.deep = MegaDeep1{
            nest: MegaDeep2{
                nest: MegaDeep3{
                    nest: MegaDeep4{
                        val: 555,
                    },
                },
            },
        };
    }
}