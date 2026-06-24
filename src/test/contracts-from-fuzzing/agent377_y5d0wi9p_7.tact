struct DeepInner {
 x: Int;
 y: Int?;
}

struct Inner1 {
 a: DeepInner;
}

struct Inner2 {
 b: DeepInner;
}

struct Inner3 {
 c: DeepInner;
}

struct Holder {
  i1: Inner1;
  i2: Inner2;
  i3: Inner3;
}

contract MultiDeepNested {
 holder: Holder = Holder{
   i1: Inner1{a: DeepInner{x:1, y: null}},
   i2: Inner2{b: DeepInner{x:2, y:null}},
   i3: Inner3{c: DeepInner{x:3, y:null}}
 };
}