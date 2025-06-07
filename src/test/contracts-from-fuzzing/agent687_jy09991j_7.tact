struct NestedDeepOptional {
    layer1: Int?;
    layer2: InnerOpt?;
}

struct InnerOpt {
    foo: Bool?;
    bar: DeepestOpt?;
}

struct DeepestOpt {
    val: Int?;
}

contract DeepOptionalContract {
    data: NestedDeepOptional;

    init() {
        self.data = NestedDeepOptional{
            layer1: null,
            layer2: InnerOpt{
                foo: null,
                bar: DeepestOpt{ val: null }
            }
        };
    }
}