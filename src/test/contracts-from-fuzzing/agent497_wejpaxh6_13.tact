struct Rec1 { a: Int; b: Bool; c: String; }
struct Rec2 { d: Int; e: Bool; f: String; }
struct Rec3 { g: Int; h: Bool; i: String; }

contract TestContract {
  r1: Rec1;
  r2: Rec2;
  r3: Rec3;

  init() {
    self.r1 = Rec1{a:1,b:true,c:"c"};
    self.r2 = Rec2{d:2,e:false,f:"f"};
    self.r3 = Rec3{g:3,h:true,i:"i"};
  }
}