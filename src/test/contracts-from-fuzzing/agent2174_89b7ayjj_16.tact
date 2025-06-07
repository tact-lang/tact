struct A1 { val: Int }
struct A2 { pre: A1; val: Int }
struct A3 { pre: A2; val: Int }
struct A4 { pre: A3; val: Int }

contract NestChain {
    store: A4;
    init() {
        self.store = A4{
            pre: A3{
                pre: A2{
                    pre: A1{val:1},
                    val:2
                },
                val:3
            },
            val:4
        };
    }
}
