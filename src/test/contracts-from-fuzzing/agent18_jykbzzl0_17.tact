struct Param {
    val: Int;
}

struct Result {
    out: Int;
}

contract Test {
    receive() {}
    
    // Getter with a struct parameter returning a struct
    get fun compute(p: Param): Result {
         return Result { out: p.val + 1 };
    }
}
