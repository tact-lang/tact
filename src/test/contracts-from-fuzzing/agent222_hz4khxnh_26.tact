struct MiddleOptOpt {
    mVal: Int?;
}

struct OutOpt {
    mid: MiddleOptOpt?;
}

contract ChainOptOpt {
    val: OutOpt = OutOpt{mid: null};

    receive() {
        self.val = OutOpt{mid: MiddleOptOpt{mVal: null}};
    }
}