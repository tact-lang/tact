struct DeepNested1 { a: Int }
struct DeepNested2 { a: DeepNested1 }
struct DeepNested3 { a: DeepNested2 }
struct DeepNested4 { a: DeepNested3 }
struct DeepNested5 { a: DeepNested4 }

contract TestContract {
    data: DeepNested5;
    init() {
        self.data = DeepNested5{
            a: DeepNested4{
                a: DeepNested3{
                    a: DeepNested2{
                        a: DeepNested1{a: 123},
                    },
                },
            },
        };
    }
}