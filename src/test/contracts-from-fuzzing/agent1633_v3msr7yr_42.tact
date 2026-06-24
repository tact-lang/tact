struct D4 { z: Int?; }
struct D3 { inner: D4; }
struct D2 { inner: D3; }
struct D1 { inner: D2; }

contract DeepNestedParam(
    param: D1,
) {}