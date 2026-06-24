fun nested_return(x: Int): Int {
    if (x > 10) {
       { 
         if (x == 20) { return x; } 
       }
    }
    return 0;
}
