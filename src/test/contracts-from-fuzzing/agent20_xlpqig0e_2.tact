fun testDoUntil(): Int {
    let x: Int = 10;
    do {
        x -= 1;
    } until (x <= 0);
    return x;
}
