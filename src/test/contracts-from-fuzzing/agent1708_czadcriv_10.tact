struct NestedStringOptional {
    inner1: InnerLevel?;
}

struct InnerLevel {
    val: String?;
    deep: Deeper?;
}

struct Deeper {
    finalVal: Int;
}

contract TestContract {
    f: NestedStringOptional;

    init() {
        self.f = NestedStringOptional{
            inner1: InnerLevel {
                val: null,
                deep: Deeper {
                    finalVal: 555
                }
            }
        };
    }
}