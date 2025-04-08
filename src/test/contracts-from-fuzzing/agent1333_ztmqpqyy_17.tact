struct Mixed {
    i: Int;
    b: Bool;
    addr: Address?;
    c: Cell?;
    s: Slice?;
    str: String;
}

contract TestContract {
    data: Mixed = Mixed{
        i:123,
        b:true,
        addr:null,
        c:null,
        s:null,
        str:"hi"
    };

    init() {
        self.data.c = emptyCell();
        self.data.s = emptyCell().asSlice();
    }

    receive() {
        dump(self.data.i);
        dump(self.data.b);
    }
}