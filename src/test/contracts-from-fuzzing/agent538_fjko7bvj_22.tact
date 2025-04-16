struct SubSub {
 x: Int = 1;
 y: Int = 2;
}

struct Sub {
 ssub: SubSub;
 flag: Bool;
}

struct Top {
 sub: Sub;
 text: String;
}

contract DeeplyNested {
 data: Top;
 init() {
   self.data = Top{
     sub: Sub{
       ssub: SubSub{ x:5, y:6 },
       flag: true
     },
     text: "ok"
   };
 }
}
