struct DeepOpt {
    inner: Int?;
}

struct Complex {
    f1: Int;
    f2: Bool;
    f3: DeepOpt?;
}

contract MixIt {
    data: Complex = Complex{
        f1: 23,
        f2: true,
        f3: null
    };
}