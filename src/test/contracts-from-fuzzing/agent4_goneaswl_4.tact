fun testNestedTryCatch(x: Int): Int {
    try {
        if (x == 0) {
            throw(1);
        } else {
            return x;
        }
    } catch (err) {
        try {
            if (x == 0) {
                throw(2);
            } else {
                return err;
            }
        } catch (err2) {
            return err2;
        }
    }
}
