// initializing nested struct in contract param style instead of init assigns
struct DeepA { x:Int; }
struct DeepB { a:DeepA; }

contract TestContract(
    field1: DeepB,
    field2: DeepA,
    num: Int,
    flag: Bool,
    text: String,
    optional: Int?
) {}