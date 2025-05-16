message HasAddress { addr: Address }

contract Test {
  receive(m: HasAddress) {}
}