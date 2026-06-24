message ComplexMsg {
  id: Int;
  data: DataPart;
}

struct DataPart {
  value: Int;
}

contract Test {
  receive() {}
}