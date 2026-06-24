struct DeepNested3 {
    val: Int?;
}

struct DeepNested2 {
    next: DeepNested3?;
}

struct DeepNested1 {
    next: DeepNested2?;
}

contract TestDeepNested {
    nested: DeepNested1?;

    init() {
        self.nested = DeepNested1{
            next: DeepNested2{
                next: DeepNested3{ val: 123 }
            }
        };
    }
}
