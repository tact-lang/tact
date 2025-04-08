struct DeepRecursion1 { next: DeepRecursion2; }
struct DeepRecursion2 { next: DeepRecursion3; }
struct DeepRecursion3 { next: DeepRecursion4; }
struct DeepRecursion4 { next: DeepRecursion5; }
struct DeepRecursion5 { val: Int; }

contract Test {
    data: DeepRecursion1;

    init() {
        self.data = DeepRecursion1{
            next: DeepRecursion2{
                next: DeepRecursion3{
                    next: DeepRecursion4{
                        next: DeepRecursion5{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}