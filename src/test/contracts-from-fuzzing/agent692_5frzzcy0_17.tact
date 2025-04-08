struct RecA {
    val: Int;
    b: RecB;
}

struct RecB {
    val: Int;
    c: RecC;
}

struct RecC {
    val: Int;
    text: String;
}

contract RecursiveChain {
    data: RecA;

    init() {
        self.data = RecA{
            val: 1,
            b: RecB{
                val: 2,
                c: RecC{
                    val: 3,
                    text: "end",
                }
            }
        };
    }
}