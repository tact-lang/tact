fun testRepeat(): Int {
    let x: Int = 1;
    // Since -1 is negative, the body should not execute
    repeat (-1) {
       x *= 3;
    }
    return x;
}
