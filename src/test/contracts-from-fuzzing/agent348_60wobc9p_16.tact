struct Leaf {
    val: Int;
}

struct HasOptStruct {
    s: Leaf?;
}

contract ParamOptStruct(
    param: HasOptStruct,
) {}