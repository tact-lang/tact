struct Tuple1 {
  first: Int;
}

struct Tuple2 {
  first: Int;
  second: Int;
}

struct Tuple3 {
  first: Int;
  second: Int;
  third: Int;
}

struct Tuple4 {
  first: Tuple1;
  second: Tuple2;
  third: Tuple3;
}

contract TupleContract {
  val: Tuple4;

  init() {
    self.val = Tuple4{
      first: Tuple1{ first: 1 },
      second: Tuple2{ first: 2, second: 3 },
      third: Tuple3{ first: 4, second: 5, third: 6 }
    };
  }
}