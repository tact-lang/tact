contract EmptyInit {
  a: Int; b: Bool; c: String; d: Cell; e: Slice; f: Address;

  init() {
    self.a=0; self.b=false; self.c=""; self.d=emptyCell(); self.e=emptyCell().asSlice(); self.f=myAddress();
  }
}