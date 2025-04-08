struct Mix {
    ix: Int;
    bx: Bool;
    sx: String;
    cx: Cell;
    ax: Address;
}

contract MixedFields {
    m: Mix;
    init() {
        self.m = Mix{
            ix: 2,
            bx: true,
            sx: "hello",
            cx: emptyCell(),
            ax: myAddress()
        };
    }
}