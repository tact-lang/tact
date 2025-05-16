// Contract using contract parameter syntax with nested structs, no init fn
struct Params {
  amount: Int;
  flag: Bool;
}

contract Test(
  myParams: Params,
  text: String,
  optNum: Int?,
  optFlag: Bool?
) {}