struct Innermost { c: Int = 7; }
struct Inner { b: Innermost = Innermost{}; }
struct Outer { a: Inner = Inner{}; }

contract DefaultsNested {
   nested: Outer;
   init() { self.nested = Outer{}; }
   receive() {}
}