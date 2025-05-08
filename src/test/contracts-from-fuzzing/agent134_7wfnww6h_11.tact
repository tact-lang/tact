struct SText {
    content: String;
    count: Int;
}

contract StructWithString {
    field: SText = SText{
        content: "hello",
        count: 5
    };
}