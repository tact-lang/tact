struct InnerS {
    x: Int;
}

struct MiddleS {
    y: InnerS;
}

struct OuterS {
    z: MiddleS;
}

contract DeepChain {
    o: OuterS = OuterS{
        z: MiddleS{
            y: InnerS{ x: 99 }
        }
    };
}