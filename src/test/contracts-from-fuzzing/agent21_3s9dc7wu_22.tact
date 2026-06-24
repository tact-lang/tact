message HasOptional { val: Int? }

contract Test {
  receive(m: HasOptional) {}
}