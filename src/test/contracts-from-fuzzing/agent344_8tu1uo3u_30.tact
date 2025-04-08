struct HasStrDef {
  s: String = "ok";
}

contract DefStrNested {
  val: HasStrDef = HasStrDef{};
}