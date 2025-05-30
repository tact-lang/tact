// Deep optional test combining mixed primitives and structs
struct DeepLeaf {
    text: String?;
    n: Int?;
    flag: Bool?;
}

struct Middle {
    dl: DeepLeaf?;
    txt: String;
}

contract MixedDeepOpt {
    data: Middle?;

    init() {
        self.data = Middle{
            dl: DeepLeaf{
                text: null,
                n: null,
                flag: true
            },
            txt: "hi"
        };
    }
}
