struct Mix {
    n: Int;             // plain
    o: Int?;           // optional
    s: String;         // plain
    so: String?;       // optional
    b: Bool;           // plain
    bo: Bool?;         // optional
    c: Cell;           // plain
    co: Cell?;         // optional
    addr: Address;     // plain
    addro: Address?;   // optional
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            n: 1,
            o: null,
            s: "s",
            so: null,
            b: true,
            bo: false,
            c: emptyCell(),
            co: null,
            addr: myAddress(),
            addro: null
        };
    }
}