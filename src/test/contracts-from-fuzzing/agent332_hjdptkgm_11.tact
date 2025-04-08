struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    oi: Int?;
    ob: Bool?;
}

contract TestContract {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            i: 1,
            b: false,
            s: "test",
            c: emptyCell(),
            a: myAddress(),
            oi: null,
            ob: true
        };
    }
}