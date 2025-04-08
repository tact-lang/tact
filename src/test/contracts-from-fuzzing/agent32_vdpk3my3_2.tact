struct Nested {
    level1: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    level2: Int;
    deeper: DeepStruct;
}

struct DeepStruct {
    level3: Int;
    value: Bool;
}

contract TestContract {
    nested: Nested = Nested{
        level1: 1,
        inner: InnerStruct{
            level2: 2,
            deeper: DeepStruct{
                level3: 3,
                value: true
            }
        }
    };

    receive() {
        // do nothing
    }
}