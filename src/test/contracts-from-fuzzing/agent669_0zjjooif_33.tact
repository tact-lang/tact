struct ManyDefaults {
    a:Int=1; b:Int=2; c:Int=3;
    s:String="s"; t:String="t";
    f:Bool=false; g:Bool=true;
}

contract DefaultCombo {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}