// Testing optional nested contract parameter
struct SN {
  f: Int?;
}

contract OptionalStructParam(
    p: SN?,
) {}
