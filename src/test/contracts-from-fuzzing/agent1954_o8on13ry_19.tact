struct Chain1 {
  next: Chain2;
  val: Int;
}

struct Chain2 {
  next: Chain3;
  val: Int;
}

struct Chain3 {
  val: Int;
}

contract LongNestedChain {
    chain: Chain1;
    init() {
        self.chain = Chain1{
            next: Chain2{
                next: Chain3{
                    val: 3,
                },
                val: 2,
            },
            val: 1,
        };
    }
}