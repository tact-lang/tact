struct Sub {
  i: Int as int64;
  s: String;
}

struct Main {
  sub1: Sub;
  sub2: Sub;
  flag: Bool;
}

contract WithSerialization {
  data: Main;

  init() {
    self.data = Main{
      sub1: Sub{i: 42, s:"foo"},
      sub2: Sub{i: -99, s:"bar"},
      flag: true,
    };
  }
}