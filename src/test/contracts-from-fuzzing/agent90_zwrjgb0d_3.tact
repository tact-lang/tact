contract TestValidInit {
    receive() {}
}

contract UseValidInitOf {
    receive() {
        let s = initOf TestValidInit();
    }
}
