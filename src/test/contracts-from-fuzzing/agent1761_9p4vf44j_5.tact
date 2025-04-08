struct NestedMixed {
    intVal: Int;
    boolVal: Bool;
    nested1: Nested1;
}

struct Nested1 {
    flag: Bool?;
    nested2: Nested2;
}

struct Nested2 {
    num: Int;
    str: String?;
}

contract TestContract {
    persistent: NestedMixed;

    init() {
        self.persistent = NestedMixed{
            intVal: 5,
            boolVal: false,
            nested1: Nested1{
                flag: null,
                nested2: Nested2{
                    num: 100,
                    str: null
                }
            }
        };
    }
}