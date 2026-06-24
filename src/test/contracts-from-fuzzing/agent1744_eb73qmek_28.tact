// test nested defaulted optional message inside optional struct inside contract param
message(123) DeepMsg {v: Int}

struct WrappedOptMsg {
    mm: DeepMsg? = null;
}

contract ParamDeepNested(
    nested: WrappedOptMsg?
) {}
