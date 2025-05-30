struct OptBoolString {
    b: Bool?;
    s: String?;
}

contract NullableTest {
    val: OptBoolString = OptBoolString{b:null,s:null};
}