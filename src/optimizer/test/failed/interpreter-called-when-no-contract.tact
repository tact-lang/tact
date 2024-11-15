// Interpreter should be called even if no contract is declared in the file.

primitive Int;

fun blowup(v: Int) {
    1 / v;
}

fun test() {
    blowup(0);   // Interpreter will execute this call and inform of a division by zero.
}
