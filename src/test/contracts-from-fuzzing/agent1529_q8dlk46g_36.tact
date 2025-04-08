// now - contract with optional of optional struct (should be flat)
struct Flat { x:Int; }

contract OptionalStructTwice {
  fld: Flat?;

  init(){
    self.fld = null;
  }
}
