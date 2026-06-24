struct Example { number: Int }

fun getExample() : Example {
    return Example { number: 42 };
}

fun test() : Int {
    let Example { number } = getExample();
    return number;
}
