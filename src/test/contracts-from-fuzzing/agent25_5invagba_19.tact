fun safeDiv(): Int {
    // Use now() to force runtime evaluation; this is non-constant even if it produces 0
    let d: Int = now() - now();
    try {
        return 42 / d;
    } catch (err) {
        return err;
    }
}

contract TestTryCatch2 {
    receive() {
        dump(safeDiv());
    }
}
