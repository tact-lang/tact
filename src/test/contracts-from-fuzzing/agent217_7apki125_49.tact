struct HasDefaults {
 x: Int = 7;
 y: Bool = true;
}

contract OptInnerDefaults(
  param: HasDefaults?,
  val: Int,
) {}