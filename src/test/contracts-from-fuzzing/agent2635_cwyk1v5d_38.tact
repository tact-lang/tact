// optional cell
contract CellOptional {
  c: Cell?;
  s: Slice?;

  init(){
    self.c = null;
    self.s = null;
  }
}