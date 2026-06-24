struct Point { x: Int; y: Int }

struct Meta { label: String?; pt: Point?; }

contract ParamsOptNested(
    id: Int,
    meta: Meta?,
) {}