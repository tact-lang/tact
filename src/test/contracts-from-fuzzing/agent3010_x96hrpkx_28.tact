struct Tiny { a:Int; }
struct Small { t:Tiny; }
struct Medium { s:Small; }
struct Large { m:Medium; }
struct Giant { l:Large; }

contract GiantChain {
  g:Giant;

  init() {
    self.g = Giant{ l: Large{ m: Medium{ s: Small{ t: Tiny{ a: 11 } } } } };
  }
}
