struct Recursion1 {
    b: Recursion2;
}

struct Recursion2 {
    c: Recursion3;
}

struct Recursion3 {
    d: Recursion4;
}

struct Recursion4 {
    e: Recursion5;
}

struct Recursion5 {
    value: Int;
}

contract DeepRecursionTest {
    data: Recursion1;

    init() {
        self.data = Recursion1{
            b: Recursion2{
                c: Recursion3{
                    d: Recursion4{
                        e: Recursion5{
                            value: 123
                        }
                    }
                }
            }
        };
    }
}
