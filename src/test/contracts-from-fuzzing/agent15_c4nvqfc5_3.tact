fun c(): Int {
    return 3;
}

fun b(): Int {
    return c() + 2;
}

fun a(): Int {
    return b() + 1;
}

contract ChainCall {
    receive() {
        let result: Int = a();
        dump(result);
    }
}
