fun main() {
    let i: Int = 1;
    while(true) {
        i = i + 1;
    }
    repeat(10) {
        i = i * 10;
    }
    do {
        i = i - 1;
    } until(false);
}