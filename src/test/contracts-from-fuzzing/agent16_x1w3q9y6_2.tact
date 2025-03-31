struct Example { number: Int }

fun get42(): Example { return Example { number: 42 } }

fun main(): Int {
    let Example { number } = get42();
    dump(number);
    return number;
}
