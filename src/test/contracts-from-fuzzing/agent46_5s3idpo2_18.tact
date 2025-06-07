struct Foo { x: Int }
struct Bar { y: Int }

struct BigStruct {
    a: Foo;
    b: Bar;
    c: Int;
    d: String;
    e: Bool;
    f: Address;
    g: Int?;
    h: Foo?;
    i: Bar?;
    j: String?;
    k: Cell?;
}

contract BigStructTest {
    bs: BigStruct;

    init() {
        self.bs = BigStruct{
            a: Foo{ x: 1 },
            b: Bar{ y: 2 },
            c: 3,
            d: "hi",
            e: true,
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null
        };
    }
}
