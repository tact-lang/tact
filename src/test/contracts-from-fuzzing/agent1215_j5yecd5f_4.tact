struct Chain1 { next: Chain2; }
struct Chain2 { next: Chain3; }
struct Chain3 { next: Chain4; }
struct Chain4 { next: Chain5; }
struct Chain5 { val: Int; }

contract LongChain(
    param: Chain1,
    optParam: Chain1?,
) {}