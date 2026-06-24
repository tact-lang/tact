contract TestGetter {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Valid getter: just returns the state variable
    get fun getFoo(): Int {
        return self.foo;
    }

    // Getter attempting to modify state; according to documentation, getters should not modify state variables,
    // but in runtime modifications will not be saved. This tests the subtle edge case.
    get fun incFoo(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }

    // A non-getter function demonstrating try...catch to safely perform division
    fun safeDiv(a: Int, b: Int): Int {
        try {
            return a / b;
        } catch (e) {
            return -1;
        }
    }

    // A function demonstrating nested try...catch
    fun nestedTry(a: Int): Int {
        try {
            try {
                if (a == 0) {
                    throw(999);
                } else {
                    return 100;
                }
            } catch (e) {
                return e + 1; // will return 1000 if a==0
            }
        } catch (outer) {
            return -999;
        }
    }
}

fun main() {
    // main is empty; the purpose is to test contract compilation
}
