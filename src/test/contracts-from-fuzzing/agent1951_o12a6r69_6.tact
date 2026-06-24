struct OptNest {
    foo: Int?;
    bar: Bool?;
    baz: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}

contract OptionalNested {
    s: OptNest;

    init() {
        self.s = OptNest{
            foo:null,
            bar:true,
            baz:InnerOpt{
                x:5,
                y:false
            }
        };
    }
}