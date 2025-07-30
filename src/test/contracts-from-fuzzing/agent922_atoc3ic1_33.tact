// Contract field referencing a struct with nested optionals
struct X { a:Int; b:Int?; c:Bool? }

contract Edge {
    f:X?;

    init(){
      self.f = null;
    }
}