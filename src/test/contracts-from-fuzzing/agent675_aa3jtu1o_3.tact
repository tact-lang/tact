struct InnerStruct {
    intVal: Int = 5;
    boolVal: Bool = true;
    stringVal: String = "abc";
}

struct OuterStruct {
    optVal: Int?;
    nested: InnerStruct;
    anotherOpt: Bool?;
}

contract DeepNestedStructTest {
    state: OuterStruct = OuterStruct{
        nested: InnerStruct{}
    };

    receive() {
        dump(self.state.nested.intVal);
    }
}