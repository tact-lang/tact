struct SI {
  a:Int?;
  b:Int;
}

contract OptIntPersist {
  rec: SI;

  init() {
    self.rec = SI{a:null,b:100};
  }
}