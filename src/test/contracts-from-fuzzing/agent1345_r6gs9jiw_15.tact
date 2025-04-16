struct DeeplyNestedOptional {
    a: OptionalDeeper?;
}

struct OptionalDeeper {
    b: OptionalDeepest?;
}

struct OptionalDeepest {
    value: Int;
}

contract DeepOptStruct {
    state: DeeplyNestedOptional;

    init() {
        self.state = DeeplyNestedOptional{
            a: OptionalDeeper{
                b: OptionalDeepest{ value: 77 }
            }
        };
    }
}