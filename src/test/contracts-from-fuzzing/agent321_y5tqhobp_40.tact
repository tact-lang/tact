struct WideNested1 {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
}

struct WideNested2 {
    x: WideNested1;
    y: WideNested1;
}

contract WideNestedTest {
    data: WideNested2;
    init() {
        let inst = WideNested1{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: myAddress(),
            f: null,
        };
        self.data = WideNested2{
            x: inst,
            y: inst,
        };
    }
}