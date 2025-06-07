struct WideSpread {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    sl: Slice;
    c: Cell;
}

struct Embed1 { a: WideSpread; }
struct Embed2 { b: Embed1; }

contract NestedWide {
    data: Embed2;

    init() {
        self.data = Embed2{
            b: Embed1{
                a: WideSpread{
                    i: 7,
                    b: true,
                    s: "hi",
                    a: myAddress(),
                    sl: emptyCell().asSlice(),
                    c: emptyCell(),
                }
            }
        };
    }
}