struct Pair { a: Int; b: Bool }

contract TestReturnValid {
    v: Int = 0;

    // Valid: explicit return literal
    fun retLiteral(): Int { 
        return 100;
    }

    // Valid: nested if-else returns
    fun retNested(b: Bool): Int {
        if (b) {
            return 20;
        } else {
            return 30;
        }
    }

    // Valid: return from inside a while loop
    fun retWhile(): Int {
        let i: Int = 0;
        while (i < 5) {
            if (i == 3) { 
                return i;
            }
            i = i + 1;
        }
        return -1;
    }

    // Getter with conditional returns
    get fun retGetter(add: Int): Int {
        if (add > 0) { 
            return self.v + add;
        }
        return self.v - add;
    }

    // Receiver with explicit return
    receive() {
        return;
    }

    // Return from nested while loops with nested blocks
    fun retNestedLoop(): Int {
        let i: Int = 0;
        while (i < 3) {
            let j: Int = 0;
            while (j < 3) {
                if (i + j == 2) { 
                    return i * j;
                }
                j = j + 1;
            }
            i = i + 1;
        }
        return 0;
    }

    // Function returning a struct using a struct literal
    fun retStructPair(): Pair {
         return Pair { a: 10, b: true };
    }
}
