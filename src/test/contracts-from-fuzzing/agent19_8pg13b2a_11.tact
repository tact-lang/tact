contract TestMultiplySimple {
    receive() {
       let res: Int = 5 * 5;
       dump(res);
    }
}
