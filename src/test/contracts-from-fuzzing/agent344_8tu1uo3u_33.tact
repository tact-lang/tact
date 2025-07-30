struct DeepDef1 { a: Int = 5; }
struct DeepDef2 { b: DeepDef1 = DeepDef1{}; }
struct DeepDef3 { c: DeepDef2 = DeepDef2{}; }

contract DeepDefaults {
  val: DeepDef3 = DeepDef3{};
}