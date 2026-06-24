struct TupleReturn { a: Int; b: Int }

contract FunctionReturnTuple {
    fun f(x: Int): TupleReturn {
         if (x < 0) { 
             return TupleReturn { a: x, b: -1 };
         } else { 
             return TupleReturn { a: x, b: 0 };
         }
    }
}
