struct Opt1 {
  a: Int?;
}

struct Opt2 {
  s: Opt1;
  b: Bool?;
}

contract TestContract {
    val: Opt2 = Opt2{s: Opt1{a:null}, b:null};
}