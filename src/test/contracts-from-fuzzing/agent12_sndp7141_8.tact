struct Two { first: Int; second: Int }

fun discard(s: Two): Int {
    let Two { second: _, first } = s;
    return first;
}

fun main(): Int {
    return discard(Two { first: 42, second: 100 });
}
