struct NestedInits {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
    name: String;
}

contract TestContract {
    data: NestedInits = NestedInits{
        inner: InnerStruct{
            val: 5,
            flag: true,
            name: "test",
        }
    };
}