struct OuterStruct {
    a: Int;
    innerB: String;
    innerC: Bool;
}

contract InlineFlattened {
    data: OuterStruct = OuterStruct{ a: 7, innerB: "x", innerC: true };
}