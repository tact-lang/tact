contract TestNestedTryValid {
    receive() {
        try {
            try {
                throw(101);
            } catch (inner) {
                dump(inner);
            }
        } catch (outer) {
            dump(outer);
        }
    }
}
