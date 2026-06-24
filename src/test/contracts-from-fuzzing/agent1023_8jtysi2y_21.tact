// contract param of struct with remaining slice inside optional
struct RemainderWrap {
  payload: Slice as remaining;
}

struct OptionalRemainder {
  wrap: RemainderWrap?;
  id: Int;
}

contract ParamOptRem(
  data: OptionalRemainder,
) {}
