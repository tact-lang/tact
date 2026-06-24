struct Chain1 { next: Chain2; val: Int; }
struct Chain2 { next: Chain3; val: String; }
struct Chain3 { next: Chain4; val: Bool; }
struct Chain4 { val: Address; }

contract ChainNested {
    c: Chain1;

    init() {
        self.c = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        val: myAddress(),
                    },
                    val: true,
                },
                val: "deep",
            },
            val: 77,
        };
    }
}