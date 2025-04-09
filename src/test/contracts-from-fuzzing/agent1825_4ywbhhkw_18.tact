struct Struct1 {
    a: Int;
    b: Bool;
}

struct Struct2 {
    c: String;
    d: Struct1;
}

contract DiffTypes {
    field: Struct2;
    init() {
        self.field = Struct2{
            c: "abc",
            d: Struct1{a:98, b:false}
        };
    }
}
