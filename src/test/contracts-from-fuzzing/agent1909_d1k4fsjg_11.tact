struct NestedManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Holder {
    field1: NestedManyOptionals;
    field2: NestedManyOptionals;
    field3: NestedManyOptionals;
}

contract ManyNestedOptionals {
    main: Holder;

    init() {
        self.main = Holder{
            field1: NestedManyOptionals{ a:null, b:null, c:null },
            field2: NestedManyOptionals{ a:null, b:null, c:null },
            field3: NestedManyOptionals{ a:null, b:null, c:null }
        };
    }
}