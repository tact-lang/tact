fun simple() : Int { return 42; }

// Testing try-catch functionality based on documentation example
fun niceCatch() : Int {
    try {
         throw(1042);
    } catch (err) {
         return err;
    }
}

// Main entry point that calls the try-catch test
fun main() : Int {
    return niceCatch();
}
