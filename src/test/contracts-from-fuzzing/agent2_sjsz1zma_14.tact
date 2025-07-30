struct DeepFirst {
    a: Int;
    rest: DeepSecond;
}

struct DeepSecond {
    b: Int;
    rest: DeepThird;
}

struct DeepThird {
    c: Int;
    rest: DeepFourth;
}

struct DeepFourth {
    d: Int;
    e: Int;
}

contract DeepChain {
    data: DeepFirst = DeepFirst{
        a:1,
        rest: DeepSecond{
            b:2,
            rest: DeepThird{
                c:3,
                rest: DeepFourth{
                    d:4,
                    e:5
                }
            }
        }
    };
}