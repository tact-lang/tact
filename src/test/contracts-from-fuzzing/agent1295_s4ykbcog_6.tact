struct OptionalDeepNested3 {
    d: Int?;
}

struct OptionalDeepNested2 {
    c: OptionalDeepNested3?;
}

struct OptionalDeepNested1 {
    b: OptionalDeepNested2?;
}

contract TestContract {
    a: OptionalDeepNested1?;

    init() {
        self.a = OptionalDeepNested1{
            b: OptionalDeepNested2{
                c: OptionalDeepNested3{
                    d: 7
                }
            }
        };
    }
}