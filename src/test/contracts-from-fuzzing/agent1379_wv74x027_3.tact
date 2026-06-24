struct DeepNested1 { a: Int; }
struct DeepNested2 { b: DeepNested1; }
struct DeepNested3 { c: DeepNested2; }
struct DeepNested4 { d: DeepNested3; }

contract DeepStorage {
    data: DeepNested4;

    init() {
        self.data = DeepNested4{
            d: DeepNested3{
                c: DeepNested2{
                    b: DeepNested1{
                        a: 42,
                    },
                },
            },
        };
    }
}
