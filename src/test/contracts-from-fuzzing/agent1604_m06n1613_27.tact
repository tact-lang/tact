struct BigChain {
    next: BigMid;
    val: Int;
}

struct BigMid {
    deeper: BigBottom;
    flag: Bool;
}

struct BigBottom {
    str: String;
    opt: Int?;
}

contract MultiDepth {
    data: BigChain;
    init() {
        self.data = BigChain{
            next: BigMid{
                deeper: BigBottom{
                    str: "deep",
                    opt: null
                },
                flag: true
            },
            val: 2024
        };
    }
    receive() {}
}