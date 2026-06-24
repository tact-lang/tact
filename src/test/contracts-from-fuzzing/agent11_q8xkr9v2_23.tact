contract Test() {
  fun f(){
  }
  receive(){self.f();}
}