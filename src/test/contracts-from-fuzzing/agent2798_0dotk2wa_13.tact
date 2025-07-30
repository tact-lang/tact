struct DeepRecursion1 {
    a: DeepRecursion2;
}

struct DeepRecursion2 {
    a: DeepRecursion3;
}

struct DeepRecursion3 {
    a: DeepRecursion4;
}

struct DeepRecursion4 {
    a: Int;
}

contract DeepRecursionContract {
    data: DeepRecursion1;

    init() {
        self.data = DeepRecursion1{
            a: DeepRecursion2{
                a: DeepRecursion3{
                    a: DeepRecursion4{
                        a: 42
                    }
                }
            }
        };
    }
}