struct A {
 x: Int;
}
contract OptionalOuter {
 val: A?;

 init() {
  self.val = null;
 }
}