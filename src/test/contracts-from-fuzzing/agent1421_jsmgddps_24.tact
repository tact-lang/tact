struct StrStruct {
    s: String;
}
contract StringField {
    str: String = "hello";
    st: StrStruct = StrStruct{s: "hi"};
}