// Combination: contract optional of nested defaulted struct chain
struct Lvl3 { x: Int = 3; }
struct Lvl2 { y: Lvl3 = Lvl3{}; }
struct Lvl1 { z: Lvl2 = Lvl2{}; }

contract MixChainOpt {
  opt: Lvl1?;
}
