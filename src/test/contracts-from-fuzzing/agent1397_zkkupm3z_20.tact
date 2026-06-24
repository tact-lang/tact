struct Mini {
    a: Int; b: Bool;
}

struct Container {
    one: Mini;
    two: Mini;
    label: String;
}

contract DoubleStruct {
    val: Container;

    init() {
        self.val = Container{ one: Mini{a:1,b:true}, two: Mini{a:2,b:false}, label:"lbl" };
    }
}