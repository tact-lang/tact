struct NullableTuple {
  first: Int?;
  second: Bool?;
}

contract NullTupleContract {
  data: NullableTuple = NullableTuple{first: null, second: null};
}