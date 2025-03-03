primitive Int;
primitive Bool;

extends mutates fun mutator(self: Int): Bool {
    self += 1;
    return false;
}

fun foo(): Int {   
    let a: Int = 10;
    let b: Bool = true;
    let c: Bool = b || a.mutator();    // Since || short-circuits, "a" remains with value a = 10
    return 1 / (a - 10);               // Division by zero.
}
