struct DeepX {
    inner: Int;
    opt: Bool?;
}

struct MidX {
    deeper: DeepX;
    other: Int;
}

struct TopX {
    nest: MidX;
}

contract Test {
    st: TopX;

    init() {
        self.st = TopX{
            nest: MidX{
                deeper: DeepX{inner:5,opt:null},
                other: 9
            }
        };
    }
}
