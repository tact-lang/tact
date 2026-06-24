struct Deep2 {
    lvl2: Deep3;
    deepVal: Int;
}

struct Deep3 {
    lvl3: Deep4;
    boolVal: Bool;
}

struct Deep4 {
    text: String;
    maybe: Int?;
}

contract DeepChainTest {
    chain: Deep2;

    init() {
        self.chain = Deep2 {
            deepVal: 77,
            lvl2: Deep3 {
                boolVal: false,
                lvl3: Deep4 { text: "x", maybe: null },
            },
        };
    }
}