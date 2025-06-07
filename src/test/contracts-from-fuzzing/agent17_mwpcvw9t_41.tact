struct Layer3 {
  q: Int;
}
struct Layer2 {
  r: Layer3;
}
struct Layer1 {
  p: Layer2;
}
contract DeepLayered {
  val: Layer1 = Layer1{p: Layer2{r: Layer3{q:999}}};
}