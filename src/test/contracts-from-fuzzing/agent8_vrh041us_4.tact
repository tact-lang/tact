fun tripleNestedThrow(): Int {
    try {
        try {
            try {
                throw(5);
            } catch (a) {
                throw(6);
            }
        } catch (b) {
            throw(7);
        }
    } catch (c) {
        return c;
    }
}
