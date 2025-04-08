struct OptionalDeepNested1 {
    next: OptionalDeepNested2?;
    val1: Int;
}

struct OptionalDeepNested2 {
    next: OptionalDeepNested3?;
    val2: Int;
}

struct OptionalDeepNested3 {
    val3: Int;
}

contract TestOptLongChain {
    data: OptionalDeepNested1;

    init() {
        self.data = OptionalDeepNested1{
            val1:1,
            next: OptionalDeepNested2{
                val2:2,
                next: OptionalDeepNested3{
                    val3:3
                }
            }
        };
    }
}
