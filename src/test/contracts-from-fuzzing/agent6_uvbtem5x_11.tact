struct Example { number: Int }

fun test_destructure(): Int {
    let Example { number } = Example { number: 42 };
    return number;
}
