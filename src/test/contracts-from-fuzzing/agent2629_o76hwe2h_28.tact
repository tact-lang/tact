struct SomeStruct {
    a: Int;
}

contract ManyOptionalNested {
    f1: SomeStruct? = null;
    f2: SomeStruct? = null;
    f3: SomeStruct? = null;
    f4: SomeStruct? = null;

    init() {}
}