fun multi(_: Int, _: Int): Int { 
    return 100;
}

contract Test {
    receive() {
        dump(multi(40, 60));
    }
}
