contract TestOptionalReturn2 {
    fun f(b: Bool): Int? {
         if (b) { return 5; }
         return null;
    }
}

struct Result { v: Int; flag: Bool }

contract TestGetterComplex2 {
    get fun get_result(x: Int): Result {
         if (x > 10) { return Result { v: x * 2, flag: true }; }
         else if (x == 10) { return Result { v: x, flag: false }; }
         else { return Result { v: 0, flag: false }; }
    }
}
