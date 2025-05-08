struct HasRemaining {
    a: Int;
    rest: Slice as remaining;
}

contract WithRemainingField {
    item: HasRemaining;

    init() {
        self.item = HasRemaining{
            a: 5,
            rest: "hi".asComment().asSlice(),
        };
    }

    receive() {
        let _=self.item;
    }
}