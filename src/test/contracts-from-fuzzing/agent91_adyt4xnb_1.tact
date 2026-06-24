contract Test1 {
    num: Int = 123;

    receive() {}

    get fun getNum(): Int {
        return self.num;
    }
}
