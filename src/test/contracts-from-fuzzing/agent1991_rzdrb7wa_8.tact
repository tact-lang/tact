struct MultipleStructs {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract ManyStructFields {
    s1: MultipleStructs;
    s2: MultipleStructs;

    init() {
        self.s1 = MultipleStructs{ a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"s1" };
        self.s2 = MultipleStructs{ a:2, b:false, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"s2" };
    }
}