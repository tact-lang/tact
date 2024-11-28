// Interpreter should be called even if no contract is declared in the file.

primitive Int;
primitive Bool;

struct A {
    a: Int;
    b: Int;
}

struct B {
    nested: A;
    c: Bool;
}

fun exprFun1(v: Int): A {
    return A {a: v + 10 + 3, b: 3 + 7}; // Interpreter cannot simplify field "b", because field "a" fails interpretation, which means 
                                        // that the entire struct instance fails interpretation. 
                                        // To actually simplify field "b" (and also field "a" which could be simplified to "v + 13"), 
                                        // we need here the partial evaluator.
}

fun exprFun2(s: A): B {
    return B {nested: s, c: true};
}

fun test() {
    let c1 = exprFun1(0).a;                                     // Interpreter simplifies to 13
    let c2 = exprFun2(exprFun1(2));                             // Interpreter simplifies to "B {nested: A {a: 15, b: 10}, c: true}"
    let c3 = exprFun2(exprFun1(1)).nested;                      // Interpreter simplifies to "A {a: 14, b: 10}"
    let c4 = exprFun2(exprFun1(2)).c || exprFun1(c1).a > 0;     // Interpreter simplifies to "true" because || short-circuits, 
                                                                // even if exprFun1(c1) cannot be simplified.
}