primitive Int;

fun foo(v: Int): Int {
    let a: Int = 7;
    let x: Int = 10;
    if (x >= 10) {    
        a = 20;        
    } else {
        a = 5;         
    }
    return 1 / (a - 20);   // Division by zero
}                           