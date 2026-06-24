struct SubData {
    value: Int?;
    status: Bool;
}

struct RootData {
    name: String;
    sub: SubData?;
}

contract ParamDeepNested(
    cfg: RootData,
) {}
