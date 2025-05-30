struct NestedFields {
    a: Int;
    b: String;
    c: Cell;
    d: Slice;
    e: Bool;
}

contract ManyNestedFields {
    f1: NestedFields;
    f2: NestedFields;
    f3: NestedFields;
    f4: NestedFields;

    init() {
        let dummy = NestedFields{a:1,b:"",c:emptyCell(),d:emptyCell().asSlice(),e:true};
        self.f1 = dummy;
        self.f2 = dummy;
        self.f3 = dummy;
        self.f4 = dummy;
    }
}