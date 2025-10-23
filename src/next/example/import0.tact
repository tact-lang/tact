import { h } from "./import1";

fun f(x: Int) {
    return x + 1;
}

contract G() {
    receive() {}

    get fun g(): Int {
        return f(41);
    }
}