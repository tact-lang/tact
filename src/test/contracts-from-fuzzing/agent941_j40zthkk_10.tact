struct StructWithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ManyOptionalStructField {
    s: StructWithManyOptionals = StructWithManyOptionals{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null
    };

    receive() {
        self.s = self.s; // trigger use
    }
}