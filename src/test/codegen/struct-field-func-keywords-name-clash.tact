struct FunCKeywords {
    var: Int;
    ifnot: Int;
    then: Int;
    elseifnot: Int;
    int: Int;
    cell: Int;
    slice: Int;
    builder: Int;
    cont: Int;
    tuple: Int;
    type: Int;
    forall: Int;
    extern: Int;
    global: Int;
    asm: Int;
    impure: Int;
    inline_ref: Int;
    auto_apply: Int;
    method_id: Int;
    operator: Int;
    infix: Int;
    infixl: Int;
    infixr: Int;
}

contract Bar {
    f: FunCKeywords = FunCKeywords {
        var: 1,
        ifnot: 1,
        then: 1,
        elseifnot: 1,
        int: 1,
        cell: 1,
        slice: 1,
        builder: 1,
        cont: 1,
        tuple: 1,
        type: 1,
        forall: 1,
        extern: 1,
        global: 1,
        asm: 1,
        impure: 1,
        inline_ref: 1,
        auto_apply: 1,
        method_id: 1,
        operator: 1,
        infix: 1,
        infixl: 1,
        infixr: 1,
    };
}
