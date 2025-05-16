struct Combination {
    i: Int;
    b: Bool;
    s: String;
}

contract CombinedFields {
    val: Combination;

    init() {
        self.val = Combination{
            i: 99,
            b: true,
            s: "combo",
        };
    }
}