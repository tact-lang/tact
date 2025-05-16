contract TestContract {
    pers: PersStruct;

    init() {
        self.pers = PersStruct{
            s: NestedStruct{
                flag: true,
                innerOpt: null
            }
        };
    }
}

struct PersStruct {
    s: NestedStruct;
}

struct NestedStruct {
    flag: Bool;
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}