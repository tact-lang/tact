struct OneField {
    x: Int;
}

struct NestedMany {
    a: OneField;
    b: OneField;
    c: OneField;
    d: OneField;
    e: OneField;
    f: OneField;
    g: OneField;
    h: OneField;
    i: OneField;
    j: OneField;
}

contract NestedLong {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            a: OneField{ x:1 },
            b: OneField{ x:2 },
            c: OneField{ x:3 },
            d: OneField{ x:4 },
            e: OneField{ x:5 },
            f: OneField{ x:6 },
            g: OneField{ x:7 },
            h: OneField{ x:8 },
            i: OneField{ x:9 },
            j: OneField{ x:10 }
        };
    }
}