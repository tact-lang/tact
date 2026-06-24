struct NestedWithOptionals {
    a:Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    x:Int;
    y:Bool;
}

contract OptionalDeep {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{a:null,inner:null};
    }
}