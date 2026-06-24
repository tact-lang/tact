struct A { val: Int; }
struct B { val: A; }
struct C { val: B; }
struct D { val: C; }

contract Nest4 {
    deep: D;

    init() {
        self.deep = D{
            val: C{
                val: B{
                    val: A{
                        val: 123
                    }
                }
            }
        };
    }
}
