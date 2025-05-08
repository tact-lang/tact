struct BigNested {
    a: Int;
    b: Int;
    c: Int;
    d: Inner1;
    e: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
    s: String;
    nested: Deeper;
}

struct Inner2 {
    flag: Bool;
    s: String;
    cell: Cell;
}

struct Deeper {
    foo: Int;
    bar: Bool;
}

contract StorageDeep {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: 2,
            c: 3,
            d: Inner1{
                x: 4,
                y: true,
                s: "hi",
                nested: Deeper{
                    foo: 5,
                    bar: false
                }
            },
            e: Inner2{
                flag: false,
                s: "",
                cell: emptyCell()
            }
        };
    }
}
