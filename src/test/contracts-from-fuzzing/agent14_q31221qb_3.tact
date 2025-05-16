struct Example { number: Int }

fun get42(): Example {
    return Example { number: 42 };
}

fun rename() {
    let Example { number: newNumber } = get42();
    // newNumber is assigned but not used, that's valid
}
