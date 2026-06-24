message StructAsMsgField {
    nested: SomeStruct
}

struct SomeStruct {
    value: Int
}

contract Test {
    receive() {
        // do nothing
    }
}