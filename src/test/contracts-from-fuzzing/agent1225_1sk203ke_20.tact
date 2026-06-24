struct Sub1 { val: Int? }
struct Sub2 { val: Sub1 }
struct Sub3 { val: Sub2 }

contract ChainNullableDeeper {
    data: Sub3;

    init() {
        self.data = Sub3{
            val: Sub2{
                val: Sub1{
                    val: null
                }
            }
        };
    }
}