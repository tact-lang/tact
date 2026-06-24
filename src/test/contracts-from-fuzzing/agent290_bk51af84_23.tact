struct Info {
    k: Int?;
    m: Bool?;
}

struct Holder {
    info: Info?;
    label: String?;
}

contract Test(
    id: Int,
    content: Holder?,
    note: String?,
    flag: Bool?,
    count: Int?,
) {
    // Contract parameters only, with nested optionals in struct
}