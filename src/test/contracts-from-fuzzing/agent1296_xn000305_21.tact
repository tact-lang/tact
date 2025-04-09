struct MultiOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Slice?;
}

contract TestContract {
    val: MultiOptional;
    init() {
        self.val = MultiOptional{
            opt1: null,
            opt2: true,
            opt3: null,
            opt4: emptyCell(),
            opt5: null,
        };
    }
}