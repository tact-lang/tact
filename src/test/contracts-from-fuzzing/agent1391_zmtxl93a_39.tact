struct DeepNest {
    lvl: MiddleNest;
}

struct MiddleNest {
    foo: InnerNest;
}

struct InnerNest {
    bar: Int;
    val: String?;
}

contract DeepNestOpts {
    field: DeepNest = DeepNest{
        lvl: MiddleNest{
            foo: InnerNest{
                bar: 42,
                val: null
            }
        }
    };
}