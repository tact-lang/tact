struct MidOpt {
    foo:Int?;
    bar:Bool?;
}

struct Top {
    nested: MidOpt?;
}

contract MidOptionalNested {
    val: Top;
    init() {
        self.val = Top{ nested:null };
    }
}