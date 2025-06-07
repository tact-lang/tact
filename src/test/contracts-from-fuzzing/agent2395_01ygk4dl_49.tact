struct LargeDefaults {
    a:Int=1;
    b:Int=2;
    c:Int=3;
    d:Int=4;
    s:String="x";
    t:String="y";
    f:Bool=false;
    g:Bool=true;
}

contract LargeDefaultsTest {
    val:LargeDefaults;

    init() {
        self.val = LargeDefaults{};
    }
}
