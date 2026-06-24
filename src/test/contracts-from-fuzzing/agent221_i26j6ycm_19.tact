struct OuterOpt {
    nested: MiddleOpt?;
}
struct MiddleOpt {
    intVal: Int;
    leaf: LeafOpt?;
}
struct LeafOpt {
    str: String;
    flag: Bool;
}

contract DeepOptionalContract {
    opt: OuterOpt;
    init() {
        self.opt = OuterOpt{
            nested: MiddleOpt{
                intVal: 99,
                leaf: null
            }
        };
    }
}