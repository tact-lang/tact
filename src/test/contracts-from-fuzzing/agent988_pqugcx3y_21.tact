struct Chain1 { val: Int; chain2: Chain2; }
struct Chain2 { val: String; chain3: Chain3; }
struct Chain3 { val: Bool; }

contract Chained {
    data: Chain1;

    init() {
        self.data = Chain1{
            val: 1,
            chain2: Chain2{
                val: "mid",
                chain3: Chain3{
                    val: true
                }
            }
        };
    }
}