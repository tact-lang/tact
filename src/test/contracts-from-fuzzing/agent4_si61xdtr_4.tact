fun niceCatch() : Int {
    try {
         throw(1042);
    } catch (err) {
         return err;
    }
}

fun main() : Int {
    return niceCatch();
}
