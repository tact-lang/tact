struct SInner {
  x: Int;
}

struct SMid {
  foo: SInner;
}

struct SCascade {
  m: SMid;
}

contract CascadeStore {
  s: SCascade;

  init(){
    self.s = SCascade{
      m: SMid{
        foo: SInner{
          x:42
        }
      }
    };
  }
}