fun returnInWhile(n: Int): Int {
    let i: Int = n;
    while(i > 0) {
        if (i == 42) { return i; }
        // simulate decrement
        let j: Int = i - 1;
        i = j;
    }
    return 0
}
