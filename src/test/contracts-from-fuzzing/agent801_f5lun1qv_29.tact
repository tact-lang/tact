struct DeepOptFinal {
    d: Int?;
}

struct DeepOptMid {
    m: DeepOptFinal?;
}

struct DeepOptStart {
    s: DeepOptMid?;
}

contract DeepOptionalsTest {
    root: DeepOptStart;

    init() {
        self.root = DeepOptStart{
            s: DeepOptMid{
                m: DeepOptFinal{
                    d: null
                }
            }
        };
    }
}