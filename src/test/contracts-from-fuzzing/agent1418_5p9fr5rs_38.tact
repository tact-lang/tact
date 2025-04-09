struct RB{
    rest:Slice as remaining;
}

struct WrapOpt{
    inside:RB?;
}

contract RemainingOptNested{
    val:WrapOpt?;

    init(){
        self.val = null;
    }
}