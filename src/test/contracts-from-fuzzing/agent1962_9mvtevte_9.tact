struct RecA { b: RecB; } 
struct RecB { c: RecC; } 
struct RecC { done: Int; }

contract Recursive {
  rec: RecA;

  init() {
    self.rec = RecA{ b: RecB{ c: RecC{done:42} } };
  }
}