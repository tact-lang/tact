import { f } from "./import2";
export { f } from "./import2";

export fun h(x: Int) {
    return x - 1;
}

contract F() {
    receive() {}

    get fun g(): Int {
        return f(41);
    }
}
