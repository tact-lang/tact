struct InnerParam { x: Int; y: Bool }
struct OuterParam { inner: InnerParam; value: Int }

contract ParamContract(
    param: OuterParam,
) {}
