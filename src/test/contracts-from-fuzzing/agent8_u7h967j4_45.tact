struct ManyDefaults2 {
 a:Int? = null; b:Int?=null; c:Int?=null; d:Int?=null; e:Int?=null;
 f:Int?=null; g:Int?=null; h:Int?=null; i:Int?=null; j:Int?=null;
}

struct Container {
 m: ManyDefaults2;
}

contract OptDfAssign {
 s: Container;
 init() {
  self.s = Container{
    m: ManyDefaults2{
      a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
    }
  };
 }
}