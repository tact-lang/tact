struct Inner { a:Int; b:Int?; c:Int; d:Int?; }

struct Mid { e:Inner; f:Int?; g:Inner; }

contract NestedMixOptional {
  root: Mid;

  init() {
    self.root = Mid{
      e: Inner{a:1,b:null,c:2,d:3},
      f: null,
      g: Inner{a:4,b:5,c:6,d:null}
    };
  }
}