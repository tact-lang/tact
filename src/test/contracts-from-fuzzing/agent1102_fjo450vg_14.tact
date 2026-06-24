// Assign optional nested struct non-null value
struct LeafStruct {
    x: Int;
}

struct ParentOptional {
    child: LeafStruct?;
}

contract FilledNestedOptional {
    data: ParentOptional;

    init() {
        self.data = ParentOptional{ child: LeafStruct{ x: 100 } };
    }
}
