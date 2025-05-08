struct Mix {
    x: Int as int32;
    s: String;
    a: Address;
    c: Cell;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            x:1234,
            s:"abc",
            a:myAddress(),
            c:emptyCell()
        };
    }
}