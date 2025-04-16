struct MultiDepth1 {
    next: MultiDepth2;
}

struct MultiDepth2 {
    next: MultiDepth3;
}

struct MultiDepth3 {
    next: MultiDepth4;
}

struct MultiDepth4 {
    next: MultiDepth5;
}

struct MultiDepth5 {
    val: Int;
}

contract DeepChain {
    data: MultiDepth1;

    init() {
        self.data = MultiDepth1{
            next: MultiDepth2{
                next: MultiDepth3{
                    next: MultiDepth4{
                        next: MultiDepth5{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}
