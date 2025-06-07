struct VeryDeep1 { val: Int }
struct VeryDeep2 { inner: VeryDeep1 }
struct VeryDeep3 { inner: VeryDeep2 }
struct VeryDeep4 { inner: VeryDeep3 }
struct VeryDeep5 { inner: VeryDeep4 }

contract ExtremlyDeepNested {
    s: VeryDeep5;

    init() {
        self.s = VeryDeep5{
            inner: VeryDeep4{
                inner: VeryDeep3{
                    inner: VeryDeep2{
                        inner: VeryDeep1{
                            val: 99
                        }
                    }
                }
            }
        };
    }
}