struct SmallStruct {
    x: Int?;
    s: String?;
}

contract KitchenSink(
    id: Int as uint32,
    name: String,
    meta: SmallStruct?,
    flag: Bool?,
    counter: Int?,
    status: Bool,
    tag: String?,
    score: Int as int64
) {}