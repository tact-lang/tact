struct WithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddr: Address?;
}

struct Complex {
    w1: WithOptionals;
    w2: WithOptionals;
}

contract TestContract {
    c: Complex = Complex{
        w1: WithOptionals{},
        w2: WithOptionals{}
    };

    init() {
        self.c = Complex{
            w1: WithOptionals{},
            w2: WithOptionals{}
        };
    }
}