struct Child {
    flag: Bool;
    text: String;
    number: Int;
    optBool: Bool?;
    optInt: Int?;
}

struct Parent {
    child1: Child;
    child2: Child?;
    flag: Bool;
    name: String;
    optChild: Child?;
}

contract OptionalNested {
    data: Parent;
    
    init() {
        self.data = Parent{
            child1: Child{
                flag: true,
                text: "hi",
                number: 1,
                optBool: null,
                optInt: null
            },
            child2: null,
            flag: false,
            name: "name",
            optChild: null
        };
    }
}