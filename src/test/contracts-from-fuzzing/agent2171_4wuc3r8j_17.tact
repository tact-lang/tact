struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

struct Wrap1 { w: BigNested }
struct Wrap2 { w: Wrap1 }
struct Wrap3 { w: Wrap2 }

contract DeepWraps {
    val: Wrap3;

    init() {
        self.val = Wrap3{
            w: Wrap2{
                w: Wrap1{
                    w: BigNested{
                        a: 1,
                        b: "s",
                        c: true,
                        d: myAddress(),
                        e: emptyCell(),
                        f: emptyCell().asSlice(),
                        g: beginCell()
                    }
                }
            }
        };
    }
}