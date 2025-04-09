struct OptDeepInner { val: Int?; }
struct OptDeepMid { inner: OptDeepInner?; }

contract OptDeepCombo {
  nested: OptDeepMid? = null;
}