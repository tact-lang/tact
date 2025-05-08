// Cross nested optional chain, complex mixed optional and non-optional
struct SInner {
    val: Int?;
}

struct SLeft {
    s: SInner?;
}
struct SRight {
    s: SInner;
}

struct RootX {
    left: SLeft?;
    right: SRight?;
    comment: String;
}

contract CrossOptionals {
    rid: RootX;

    init() {
        self.rid = RootX{
            left:null,
            right:null,
            comment:"done"
        };
    }
}