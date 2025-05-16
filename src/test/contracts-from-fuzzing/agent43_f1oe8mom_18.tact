contract TestNestedTry() {
    receive() {
        try {
            try {
                throw(123);
            } catch (inner) {
                dump(inner); // should dump 123
                require(inner == 123, "Inner catch failed");
            }
        } catch (outer) {
            dump(outer); // should not be executed
        }
        cashback(sender());
    }
}
