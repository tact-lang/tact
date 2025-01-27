primitive Int;
primitive Bool;

extends mutates fun mutator(self: Int): Bool {
    self += 1;
    return false;
}

fun foo(b: Bool): Int {   
    let a: Int = 10;
    let c: Bool = b || a.mutator();    // b cannot be determined. Analysis stops.
    return 1 / (a - 10);               
}