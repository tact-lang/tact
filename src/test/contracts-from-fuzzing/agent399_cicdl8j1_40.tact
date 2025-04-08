struct PartialDefaults {
    a:Int = 1;
    b:Bool;
    s:String = "ok";
}

contract StructPartialDefaultsTest {
    val: PartialDefaults;

    init() {
        self.val = PartialDefaults{ b:true };
    }
}