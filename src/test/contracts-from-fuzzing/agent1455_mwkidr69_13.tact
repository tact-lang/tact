struct Some {
    a: Int;
    b: Bool;
}

struct Another {
    c: Int?;
    d: Some;
}

contract MultipleNestedOptionals {
    val: Another?;

    init() {
        self.val = Another{
            c: null,
            d: Some{a:42,b:true}
        };
    }
}
