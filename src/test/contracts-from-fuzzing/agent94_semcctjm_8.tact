contract OptionalReturnTest {
    // Function returning an optional Int
    fun optionalReturn(x: Int): Int? {
        if (x > 10) {
            return x;
        } else {
            return null;
        }
    }

    // Getter returning an optional Int using a struct-like pattern operation
    get fun optionalGetter(): Int? {
        // Explicitly returning null is allowed
        return null;
    }

    // Function returning an optional Int, testing mixed control flow
    fun mixedOptionalReturn(x: Int): Int? {
        if (x == 0) {
            return null;
        } else if (x > 0) {
            return x * 2;
        } else {
            return x - 2;
        }
    }

    // Function returning a non-optional Int, but sometimes attempting to return null (should be error)
    // This test is intentionally commented out to avoid breakage since it's documented as error:
    // fun nonOptionalReturn(x: Int): Int {
    //     if (x > 0) {
    //         return x;
    //     } else {
    //         return null; // expected error: type mismatch
    //     }
    // }
}
