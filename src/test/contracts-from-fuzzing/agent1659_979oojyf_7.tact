struct NestedManyOptionals {
    option1: Int?;
    option2: String?;
    option3: Bool?;
    sub: SubStruct?;
}

struct SubStruct {
    f1: Int?;
    f2: String?;
    f3: Bool?;
}

contract TestContract {
    storage: NestedManyOptionals;

    init() {
        self.storage = NestedManyOptionals{
            option1: null,
            option2: null,
            option3: null,
            sub: null
        };
    }
}