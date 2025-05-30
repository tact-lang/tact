struct Chain1 { a: Int; }
struct Chain2 { p: Chain1; }
struct Chain3 { q: Chain2; }

contract ParamDeepNested(
    deep: Chain3
) {}