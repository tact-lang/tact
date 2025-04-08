struct NestedMessage1 {
  x: Int;
}

struct NestedMessage2 {
  nm1: NestedMessage1;
}

contract NestedMsgContract {
  data: NestedMessage2 = NestedMessage2{
    nm1: NestedMessage1{x: 42}
  };
}