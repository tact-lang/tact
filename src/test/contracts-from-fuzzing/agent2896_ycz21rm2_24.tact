struct S { 
 a: Int; 
 b: Bool; 
 c: String;
}

struct Outer {
 inner: S;
 value: Int;
}

contract NestedWithExtras {
 s: Outer;

 init() {
  self.s = Outer{
    inner: S{ a:1, b:true, c:"hi" },
    value: 10
  };
 }
}