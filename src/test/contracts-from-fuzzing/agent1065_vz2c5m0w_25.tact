struct SDeep1 { a: Int }
struct SDeep2 { b: SDeep1 }
struct SDeep3 { c: SDeep2 }
struct SDeep4 { d: SDeep3 }
struct SDeep5 { e: SDeep4 }

contract NestedFiveStructs {
    val: SDeep5;

    init() {
        self.val = SDeep5{
            e: SDeep4{
                d: SDeep3{
                    c: SDeep2{
                        b: SDeep1{
                            a: 321
                        }
                    }
                }
            }
        };
    }
}
