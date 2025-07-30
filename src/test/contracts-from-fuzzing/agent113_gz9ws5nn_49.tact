struct ChainOpt1 {
  next: ChainOpt2?;
}
struct ChainOpt2 {
  next: ChainOpt3?;
}
struct ChainOpt3 {
  leaf: Int?;
}

contract ChainOptContract {
  r: ChainOpt1;

  init() {
    self.r = ChainOpt1{next:null};
  }
}