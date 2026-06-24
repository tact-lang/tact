struct Example { number: Int }

fun get42(): Example { return Example { number: 42 } }

fun basic() {
    let Example { number } = get42();
    // Use dump to force evaluation
    dump(number);
}
