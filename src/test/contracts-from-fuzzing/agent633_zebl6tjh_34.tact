struct NestedWithNull {
    k: Int? = null;
}

struct OuterWrap {
    nested: NestedWithNull;
}

contract OuterNullHolder {
    val: OuterWrap = OuterWrap{
        nested: NestedWithNull{}
    };
}