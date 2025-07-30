contract TestAscii {
    // 33 characters, since each ASCII is 1 byte so the argument length is 33>
    a: Int = ascii("abcdefghijklmnopqrstuvwxyzABCDE");
    receive() {}
}
