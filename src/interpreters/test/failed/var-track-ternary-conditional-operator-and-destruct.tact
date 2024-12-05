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
    
    let SB {Ba, Bb, Bc} = (v1.Ca.Aa > 0) ? v1.Ca.Ab : v2.Ca.Ab;   // Condition cannot be determined. Hence, the result will be the join of both 
                                                                  // results in the ternary operator ?.
                                                                  // In this case, the common substructure between v1.Ca.Ab and v2.Ca.Ab is the 
                                                                  // partially constructed struct: SB {Bc: 1}
                                                    
    
    /* The rationale for computing the common substructure is that the above statement can be seen as this conditional:
       
       if (v1.Ca.Aa > 0) {
           Ba = undefined;
           Bb = 2;
           Bc = 1;
       } else {
           Ba = 3;
           Bb = undefined;
           Bc = 1;
       }
       
       So, joining both branches we get:
       
       Ba = undefined;
       Bb = undefined;
       Bc = 1;

       which is the partially constructed struct: SB {Bc: 1} which gets destructed by the destructuring let, where only variable 
       Bc is determined.
    */
    
    1 / (Bb - 2);              // OK, because Bb is undetermined.
    1 / (Ba - 3);              // OK, because Ba is undetermined.
    return 1 / (Bc - 1);       // Division by zero
}
