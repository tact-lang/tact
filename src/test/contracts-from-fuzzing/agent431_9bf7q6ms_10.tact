struct DeepSub1 { val: Int; }
struct DeepSub2 { inner: DeepSub1; }
struct DeepSub3 { inner: DeepSub2; }
struct DeepSub4 { inner: DeepSub3; }
struct DeepSub5 { inner: DeepSub4; }

contract VeryDeepNested {
    nested: DeepSub5;

    init() {
        self.nested = DeepSub5{
            inner: DeepSub4{
                inner: DeepSub3{
                    inner: DeepSub2{
                        inner: DeepSub1{ val:123 }
                    }
                }
            }
        };
    }
}
