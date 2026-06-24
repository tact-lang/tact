struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    a1: Address;
    a2: Address;
    n1: Int?;
    n2: Bool?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            i1: 1, i2: 2, i3: 3, i4: 4, i5: 5, i6: 6, i7: 7, i8: 8, i9: 9, i10: 10,
            b1: true, b2: false,
            s1: "foo", s2: "bar",
            a1: myAddress(), a2: myAddress(),
            n1: null, n2: null,
        };
    }
}
