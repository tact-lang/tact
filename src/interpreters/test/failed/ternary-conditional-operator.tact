primitive Int;

struct SA {
    Aa: Int;
    Ab: SB;
}

struct SB {
    Ba: Int;
    Bb: Int;
    Bc: Int;
}

struct SC {
    Ca: SA;
}

fun foo(v1: SC, v2: SC): Int {   
    v1.Ca.Ab.Bc = 1;            // Every other field in v1 is undetermined (including nested fields).
    v1.Ca.Ab.Bb = 2;            
    v2.Ca.Ab.Bc = 1;            // Every other field in v2 is undetermined (including nested fields).
    v2.Ca.Ab.Ba = 3;
    
    let c: SA = (v1.Ca.Aa > 0) ? v1.Ca : v2.Ca;     // Condition cannot be determined. Hence, the result will be the join of both 
                                                    // results in the ternary operator ?.
                                                    // In this case, the common substructure between v1.Ca and v2.Ca is the partially constructed struct:
                                                    // Aa {Ab: SB {Bc: 1}}
    
    /* The rationale for computing the common substructure is that the above statement can be seen as this conditional, where the path 
       expressions are seen as single "variables":
       
       if (v1.Ca.Aa > 0) {
           c.Ab.Ba = undefined;
           c.Ab.Bb = 2;
           c.Ab.Bc = 1;
           c.Aa = undefined;
       } else {
           c.Ab.Ba = 3;
           c.Ab.Bb = undefined;
           c.Ab.Bc = 1;
           c.Aa = undefined;
       }
       
       So, joining both branches we get:
       
       c.Ab.Ba = undefined;
       c.Ab.Bb = undefined;
       c.Ab.Bc = 1;
       c.Aa = undefined;

       which is the partially constructed struct: Aa {Ab: SB {Bc: 1}}
    */
    
    1 / (c.Ab.Bb - 2);              // OK, because c.Ab.Bb is undetermined.
    1 / (c.Ab.Ba - 3);              // OK, because c.Ab.Ba is undetermined.
    return 1 / (c.Ab.Bc - 1);       // Division by zero
}
