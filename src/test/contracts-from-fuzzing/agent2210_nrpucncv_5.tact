struct NestedOptWithinOpt {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    maybeDeep: Deep?;
}

struct Deep {
    val: Int?;
}

contract ComplexOpt {
    storage: NestedOptWithinOpt;

    init() {
        self.storage = NestedOptWithinOpt{
            maybeInner: InnerStruct {
                maybeDeep: Deep {
                    val: 777
                }
            }
        };
    }
}