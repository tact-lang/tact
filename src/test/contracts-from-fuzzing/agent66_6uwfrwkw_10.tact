struct OptionalDeeper {
    f1: Int?;
    f2: NestedOptional?;
}

struct NestedOptional {
    bar: Int?;
    baz: Int?;
    deep: InnerMostOpt?;
}

struct InnerMostOpt {
    inn: Int?;
}

contract DeepOptLayer {
    state: OptionalDeeper;

    init() {
        self.state = OptionalDeeper{
            f1: null,
            f2: NestedOptional{
                bar: null,
                baz: 11,
                deep: InnerMostOpt{
                    inn: 42
                }
            }
        };
    }
}