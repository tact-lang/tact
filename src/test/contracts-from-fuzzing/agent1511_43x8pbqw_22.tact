struct BigMix {
    x: Int;
    y: Int?;
    flag: Bool?;
    label: String;
    ref: Cell;
}

contract BigMixContract {
    val: BigMix;
    init() {
        self.val = BigMix{
            x: 10,
            y: null,
            flag: true,
            label: "aaa",
            ref: emptyCell(),
        };
    }
}