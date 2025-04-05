contract TestTernary {
    receive() {
       let res: String = (2 + 2 == 4) ? "correct" : "incorrect";
       dump(res);
    }
}
