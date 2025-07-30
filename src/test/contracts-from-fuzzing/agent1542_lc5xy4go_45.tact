message EmptyMsg {}

contract UseEmptyMsg {
    receive() {
        let m = EmptyMsg{};
        dump(m.toCell());
    }
}
