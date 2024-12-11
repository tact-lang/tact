primitive Int;
primitive Bool;

extends mutates fun mutator(self: Int): Bool {
    self += 1;
    return false;
}

fun foo(b: Bool): Int {   
    let a: Int = 10;
    let c: Bool = b && a.mutator();    // b cannot be determined. Since && short-circuits, in one branch, "a" mutates when && evaluates 
                                       // its second argument, but in the branch where && short-circuits, "a" remains with value 10.
                                       // Therefore, when branches are joined "a" is undetermined.
    return 1 / (a - 10);               // OK, because "a" is undetermined.
}
