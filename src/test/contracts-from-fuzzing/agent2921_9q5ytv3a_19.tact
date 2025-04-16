struct SInner {
    data: Int;
}

struct SOuter {
    i: Int;
    innerOpt: SInner?;
}

contract OptionalInner {
    val: SOuter;

    init(){
        self.val = SOuter{
            i:8,
            innerOpt: SInner{data:10}
        };
    }
}