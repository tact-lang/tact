struct MultiDepthOptional {
    lvlA: OptLevel?;
}

struct OptLevel {
    lvlB: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool?;
}

contract TestContract {
    d: MultiDepthOptional = MultiDepthOptional{
        lvlA: OptLevel{
            lvlB: null
        }
    };
}