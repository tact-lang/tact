contract TestTypeConversion {
    receive() {
        // Using extension function to convert Int to String
        dump(42.toString());
    }
}
