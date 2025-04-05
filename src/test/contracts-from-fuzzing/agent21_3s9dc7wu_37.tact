struct Named { a: Int; b: Int }

contract Test {
  receive() {
    let s: Named = Named { a: 1, b: 2 };
  }
}