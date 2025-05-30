struct WithRemanent {
   a: Int;
   rest: Slice as remaining;
}

contract RemainField {
    val: WithRemanent;

    init() {
        self.val = WithRemanent{
            a: 42,
            rest: emptyCell().asSlice(),
        };
    }
}
