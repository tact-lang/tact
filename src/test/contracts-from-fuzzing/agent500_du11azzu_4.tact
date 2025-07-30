struct Big {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Cell;
    g: Int;
}

contract ManyFields {
    value: Big;
    init() {
        self.value = Big{
            a:1,
            b:true,
            c:2,
            d:false,
            e:"hello",
            f: emptyCell(),
            g:3
        };
    }
    receive() {}
}