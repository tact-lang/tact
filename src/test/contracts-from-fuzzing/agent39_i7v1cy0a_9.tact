contract TestTonAmbiguous {
    // Using ton() with ambiguous numeric format "0." - which may be interpreted or rejected
    ambiguousTon: Int = ton("0.");

    // Dummy receiver to force full compilation
    receive() {}
}
