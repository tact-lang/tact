struct RecursionA {
    nested: RecursionB?;
}

struct RecursionB {
    nested: RecursionC?;
}

struct RecursionC {
    value: Int;
}

contract RecursiveOptionals {
    data: RecursionA;

    init() {
        self.data = RecursionA{
            nested: RecursionB{
                nested: RecursionC{
                    value: 777
                }
            }
        };
    }
}