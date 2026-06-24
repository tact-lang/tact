struct SBoolInt {
    x: Bool;
    y: Int;
}

contract ReverseAssign {
    val: SBoolInt;

    init() {
        self.val = SBoolInt{
            y:42,
            x:true
        };
    }
}
