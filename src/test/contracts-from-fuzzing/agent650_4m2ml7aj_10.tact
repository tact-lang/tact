struct Deep {
 a: Int;
 b: Int;
 c: Int;
 d: Inner1;
}

struct Inner1 {
 x: Int;
 y: Inner2;
}

struct Inner2 {
 alpha: Bool;
 beta: String;
 gamma: Inner3;
}

struct Inner3 {
 k: Int;
 m: String;
 n: Bool;
}

contract TestContract {
   st: Deep;

   init() {
       self.st = Deep{
           a: 1,
           b: 2,
           c: 3,
           d: Inner1{
               x: 4,
               y: Inner2{
                   alpha: true,
                   beta: "beta",
                   gamma: Inner3{
                       k: 42,
                       m: "str",
                       n: false
                   }
               }
           }
       };
   }
}
