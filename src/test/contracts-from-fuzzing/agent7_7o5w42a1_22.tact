message HasOptional {
  maybe_x: Int?;
}

contract Test {
  receive() {
    let h = HasOptional { maybe_x: null };
  }
}