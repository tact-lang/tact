struct Two { first: Int; second: Int; }

fun test1(): Int {
    let t: Two = Two { first: 10, second: 20 };
    let Two { first, second } = t;
    return first + second;
}

// Entry point to call test1 and check result via dump
fun main() {
    dump(test1());
}