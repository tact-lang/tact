fun multiCatchFlow(cond: Bool): Int {
    try {
        if (cond) {
            throw(100);
        } else {
            throw(200);
        }
    } catch (e) {
        if (e == 100) {
            return 1;
        } else {
            return 2;
        }
    }
}

fun tryWithoutCatch(): Int {
    try {
        throw(55);
    } catch (_) {
        // Error is discarded
    }
    return 999;
}

fun nestedMultiLevel(): Int {
    try {
        try {
            if (false) {
                throw(150);
            } else {
                // no exception thrown here
            }
            return 0;  // reachable in this branch
        } catch (inner) {
            if (inner == 150) {
                return inner + 50;
            } else {
                throw(inner);
            }
        }
    } catch (outer) {
        return outer;
    }
}

contract ReceiverMultiFlow {
    v: Int;

    init() {
        self.v = 10;
    }

    receive("multi") {
        if (sender() == myAddress()) {
            try {
                if (self.v > 15) {
                    throw(300);
                } else {
                    self.v = self.v + 5;
                    return; // early exit
                }
            } catch (code) {
                self.v = self.v - code;
            }
        } else {
            self.v = 0;
        }
    }
}
