struct InnerMissing { v: Int; }
struct WrapOptional { inner: InnerMissing? = null; }

contract ParamOptStruct(
    p: WrapOptional?,
) {}