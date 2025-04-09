struct Crazy {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract Chaos {
    val: Crazy;

    init() {
        self.val = Crazy{
            a: 1, b: null, c: true, d: null, e: "hello", f: null, g: myAddress(), h: null, i: emptyCell(), j: null
        };
    }
}