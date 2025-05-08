struct InlineDefaults {
    x:Int=5;
    y:Bool=false;
    z:String="hello";
}

contract WithDefaults {
    rec: InlineDefaults;

    init() {
        self.rec = InlineDefaults{};
    }
}
