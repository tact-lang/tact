fun function(a: Int, b: Int): Int {
    return (a >> b) || (a << (32 - b));
}

fun anotherFunction(
    a: Int,
    b: Int,
    ): Int {
    return (a >> b) || (a << (32 - b));
}

extends fun extension(self: Int, c: Int, d: Int) {
    return self + c + d;
}

fun coverage(a: Int, b: Int) {
    let k: Int = a.extension(
        b,
        4,
    );

    let c: Int = anotherFunction(
        a,
        b,
    );
}

fun oneMoreFunction(
    a: Int,
    b: Int,
    ): Int {
    return anotherFunction(
        a,
        b,
    );
}

contract TestContract {
    init(
        arg1: Int,
        arg2: Int,
    ) {}
}

fun test() {
    let k: StateInit = initOf TestContract(
        2,
        3,
    );
}
