contract TestGetterLoop {
    offset: Int = 0;

    receive() {}

    get fun getLoopSum(): Int {
        let sum: Int = 0;
        let i: Int = 1;
        while (i <= 5) {
            sum += i;
            i += 1;
        }
        return sum;
    }
}
