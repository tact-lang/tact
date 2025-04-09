fun returnInDoUntil(): Int {
    let x: Int = 10;
    do {
        if (x == 7) {
            return 999; // early return when x reaches 7
        }
        x -= 1;
    } until (x <= 0);
    return x;
}
