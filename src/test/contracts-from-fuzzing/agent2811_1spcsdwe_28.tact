struct Complex {
    i:Int;
    s:String;
    o:Int?;
    b:Bool;
}

contract NestedComplex {
    val: Complex?;

    init() {
        self.val = null;
    }
}