fun inner(): Int {
    try {
        throw(5);
    } catch (e) {
        return e + 1;
    }
}

fun nestedTry(): Int {
    try {
       let res: Int = inner();
       return res;
    } catch (e) {
       return e + 10;
    }
}

fun main() {
    nestedTry();
}
