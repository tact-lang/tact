struct Nested {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract SetNestedLate {
    field: Nested;

    init() {
        self.field = Nested{ foo:null, bar:null, baz:null };
    }

    receive() {
        self.field = Nested{ foo:99, bar:"hi", baz:true }; 
    }
}
