contract TestTernary {
    receive() {
       dump(true ? 1 : 0);
    }
}
