// A nested contract parameter with slice, cell and string
struct CCC {
  a: Slice;
  b: Cell;
  c: String;
}
contract ParamPrims(
  data: CCC,
) {
  receive() {}
}