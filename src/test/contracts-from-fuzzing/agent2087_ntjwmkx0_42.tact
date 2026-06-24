struct Simple {
    a: Int;
}

contract WithConstInit {
    c: Simple = Simple{a:42};
}