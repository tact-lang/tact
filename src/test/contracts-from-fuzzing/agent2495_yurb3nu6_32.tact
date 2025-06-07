struct Container {
    a: Int;
}

struct NestedOptContainer {
    foo: Int;
    bar: Container?;
}

contract NestedOptInStruct {
    val: NestedOptContainer;

    init() {
        self.val = NestedOptContainer{
            foo: 1,
            bar: null
        };
    }
}