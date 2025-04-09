fun nestedComplexControlFlow(): Int {
    let temp: Int = 0;
    try {
       if (1 + 1 == 2) {
         try {
            if (temp == 0) {
                return 42; 
            }
         } catch (inner) {
            return 1;
         }
         return 100;
       } else {
         return 0;
       }
    } catch (outer) {
       return outer;
    }
}
