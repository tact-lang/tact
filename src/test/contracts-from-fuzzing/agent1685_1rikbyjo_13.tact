struct NullableStruct {
    num: Int?;
}

struct Container {
    a: NullableStruct?;
}

contract OptionStruct {
    val: Container;

    init() {
        self.val = Container{
            a: null
        };
    }
}
