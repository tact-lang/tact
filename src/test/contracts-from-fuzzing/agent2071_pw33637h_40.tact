struct Depth1 {
    a:Int?;
}

struct Depth2 {
    i:Depth1?;
}

struct Depth3 {
    j:Depth2?;
}

contract OptionChain {
    x: Depth3;

    init() {
        self.x = Depth3{
            j: Depth2 {
                i: Depth1 {
                    a: null
                }
            }
        };
    }
}