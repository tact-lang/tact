contract TestTernaryProper {
    receive() {
       let a: Int = false ? (false ? 1 : 2) : 3;
       dump(a);
       return;
    }
}
