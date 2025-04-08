struct RecursiveNestA {
    val: Int;
    sub: RecursiveNestB;
}

struct RecursiveNestB {
    val: Bool;
    sub: RecursiveNestC;
}

struct RecursiveNestC {
    val: String;
    sub: RecursiveNestD;
}

struct RecursiveNestD {
    val: Address;
}

contract RecursiveContractTest {
    field: RecursiveNestA;

    init() {
        self.field = RecursiveNestA{
            val: 5,
            sub: RecursiveNestB{
                val: true,
                sub: RecursiveNestC{
                    val: "hi",
                    sub: RecursiveNestD{
                        val: myAddress()
                    }
                }
            }
        };
    }
}