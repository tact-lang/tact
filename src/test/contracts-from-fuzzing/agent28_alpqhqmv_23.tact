message ConflictingNames {
  ConflictingNames: Int
}

contract Test {
  receive() {
    let m: ConflictingNames = ConflictingNames{ConflictingNames:10};
  }
}