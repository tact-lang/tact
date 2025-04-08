struct NestedManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainsNestedManyOptionals {
    nested: NestedManyOptionals;
}

contract ManyOptionalsNestedContract {
    foo: ContainsNestedManyOptionals = ContainsNestedManyOptionals{
        nested: NestedManyOptionals{a:null,b:null,c:null}
    };
}