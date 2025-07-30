message EmptyMsg {}

contract Bugged {
  x: EmptyMsg = EmptyMsg{};
}
