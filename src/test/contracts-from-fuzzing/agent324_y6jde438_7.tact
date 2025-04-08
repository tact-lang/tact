struct Inner1 {
    val: Int;
    optStr: String?;
}

struct Inner2 {
    boolField: Bool;
    nested: Inner1?;
}

contract NestedManyOptional {
    field1: Int?;
    field2: String?;
    field3: Bool?;
    field4: Inner1?;
    field5: Inner2?;

    init() {
        self.field1 = 123;
        self.field2 = "hi";
        self.field3 = true;
        self.field4 = Inner1{val: 1, optStr: null};
        self.field5 = Inner2{boolField: false, nested: null};
    }
}