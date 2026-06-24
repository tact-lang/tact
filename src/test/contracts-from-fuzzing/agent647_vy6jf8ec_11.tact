struct Inner1 { b: Bool; }
struct Inner2 { s: String; }
struct Inner3 { o: Int?; }

struct Combo {
  f1: Inner1;
  f2: Inner2;
  f3: Inner3;
}

contract ComboContract {
  combined: Combo;

  init() {
    self.combined = Combo{
      f1: Inner1{b:true},
      f2: Inner2{s:"x"},
      f3: Inner3{o:null}
    };
  }
}