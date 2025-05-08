struct NestedOptionals {
    inner: InnerOptionals;
}

struct InnerOptionals {
    val1: Int?;
    val2: Int?;
    val3: Int?;
    val4: Bool?;
    val5: Bool?;
}

contract TestContract {
    nestedOpt: NestedOptionals;

    init() {
        self.nestedOpt = NestedOptionals{
            inner: InnerOptionals{
                val1: null,
                val2: 2,
                val3: null,
                val4: true,
                val5: null
            }
        };
    }
}