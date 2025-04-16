struct NestedOptionals {
    innerOpt: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract Test {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            innerOpt: Inner{ x:null, y:true }
        };
    }
}