// Nested contract parameter struct with optionals, no init()
struct Params {
  v1:Int?;
  v2:Bool?;
  text:String;
}

contract Test(
  params: Params,
  another:Int
) {}