struct RemainTail {
  prefix: Int;
  suffix: Cell as remaining;
}

contract SuffixRemainingField {
  r: RemainTail;
  init(){
    self.r = RemainTail{prefix:42,suffix:emptyCell()};
  }
}