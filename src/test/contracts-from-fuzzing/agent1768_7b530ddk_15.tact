struct DeepStructLevelA {
    b: DeepStructLevelB;
}

struct DeepStructLevelB {
    c: DeepStructLevelC;
}

struct DeepStructLevelC {
    d: DeepStructLevelD;
}

struct DeepStructLevelD {
    e: DeepStructLevelE;
}

struct DeepStructLevelE {
    f: Int;
    g: Bool;
}

contract TestStorage {
    nested: DeepStructLevelA;

    init() {
        self.nested = DeepStructLevelA{
            b: DeepStructLevelB{
                c: DeepStructLevelC{
                    d: DeepStructLevelD{
                        e: DeepStructLevelE{
                            f: 123,
                            g: true
                        }
                    }
                }
            }
        };
    }
}