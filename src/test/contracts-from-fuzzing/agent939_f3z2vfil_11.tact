struct Mix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract TestContract {
    combo: Mix;

    init() {
        self.combo = Mix{
            i: 777,
            b: true,
            s: "hello",
            c: emptyCell(),
            a: myAddress()
        };
    }
}