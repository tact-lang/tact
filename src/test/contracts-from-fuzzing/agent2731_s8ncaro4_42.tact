struct Sub {
 a: Int;
}

contract FlatWithDefaults {
 a: Int = 0;
 b: Int = 1;
 c: Bool = true;
 s: Sub = Sub{a:5};

 init() {
   self.a=10;
   self.b=11;
   self.c=false;
   self.s=Sub{a:42};
 }
}