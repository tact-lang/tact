struct Pair { a: Int; b: Int; }

fun retOptional(x: Int): Int? {
    if (x > 0) {
        return x;
    } else {
        return null;
    }
}

fun nestedExtreme(x: Int): Int {
    if (x == 1) {
        {
            if (x > 0) {
                return x * 10;
            }
        }
    } else if (x == 2) {
        repeat (3) {
            if (x > 1) {
                return x * 20;
            }
        }
    }
    return x;
}

contract GetterTest {
    // Getter function with explicit returns on all branches
    get fun getPair(flag: Bool): Pair {
        if (flag) {
            return Pair{ a: 5, b: 6 };
        } else {
            return Pair{ a: 7, b: 8 };
        }
    }
}

message Msg { value: Int; }

contract ReceiverTest {
    // Receiver function, purposely not callable from main
    receive(msg: Msg) {
        if (msg.value == 0) {
            return;
        }
        dump(msg.value);
    }
}

fun main() {
    let a = retOptional(10);
    let b = retOptional(-5);
    let c = nestedExtreme(1);
    let d = nestedExtreme(2);
    let e = nestedExtreme(3);

    // Contracts (GetterTest and ReceiverTest) are defined but not directly invoked from main
}
