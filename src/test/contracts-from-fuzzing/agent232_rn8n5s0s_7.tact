struct NestedOptional {
    n: Int?;
    s: String?;
    child: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    x: Int;
}

contract OptTest {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{
            n:null,
            s:null,
            child:null
        };
    }
}