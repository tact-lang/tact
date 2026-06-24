struct OptionalsMixNested {
    field1: Int;
    field2: Bool?;
    field3: String?;
}

contract OptionalsNestedTest {
    a: Int? = null;
    b: Bool? = null;
    c: OptionalsMixNested = OptionalsMixNested{field1:0,field2:null,field3:null};
}