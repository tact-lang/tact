struct ConflictingNames {
  ConflictingNames: Int
}

contract Test {
  receive() {
    let c: ConflictingNames = ConflictingNames{ConflictingNames:5};
  }
}