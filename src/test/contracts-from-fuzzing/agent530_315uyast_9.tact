struct Composite {
    x: Int;
    y: Int?;
    s: String;
    flag: Bool;
    addr: Address?;
    c: Cell;
    sl: Slice?;
}

contract MixedTypes {
    var: Composite;

    init() {
        self.var = Composite{
            x: 5,
            y: null,
            s: "hi",
            flag: true,
            addr: null,
            c: emptyCell(),
            sl: null
        };
    }
}