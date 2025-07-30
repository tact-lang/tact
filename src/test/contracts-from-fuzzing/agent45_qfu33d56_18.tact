struct ManyDefaults {
    i:Int=10;
    b:Bool=false;
    s:String="str";
    opt:Int?=null;
}
contract DefaultsStructTest {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}