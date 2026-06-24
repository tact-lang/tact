struct DeeplyNested {
    s: Shallow;
}

struct Shallow {
    tiny: Tiny;
}

struct Tiny {
    flag: Bool;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s: Shallow{
                tiny: Tiny{
                    flag: true
                }
            }
        };
    }
}