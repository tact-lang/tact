fun complex_return(x: Int): Int {
    if (x > 10) {
        return x;
    } else if (x < 0) {
        return -x;
    } else {
        if (x == 0) {
            return 100;
        }
    }
    return 42;
}
