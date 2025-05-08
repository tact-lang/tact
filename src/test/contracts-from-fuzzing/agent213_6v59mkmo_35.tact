struct MultTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
}

contract M {
    val: MultTypes;

    init() {
        self.val = MultTypes{ i:1, b:false, s:"hello", a:myAddress(), c:emptyCell() };
    }
}