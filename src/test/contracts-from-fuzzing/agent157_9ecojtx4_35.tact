contract NestedOptionalNulls {
    fld: TopOpt?;

    init() {
        self.fld = TopOpt{
            next: MidOpt{
                next: InnerOpt{
                    val: null
                }
            }
        };
    }
}

struct TopOpt {
    next: MidOpt?;
}

struct MidOpt {
    next: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}
