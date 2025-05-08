message EmptyMsg {}

contract AcceptsEmpty {
    receive(_: EmptyMsg) {}
}