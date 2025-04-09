struct Param {
    p: Int;
}

struct Result {
    res: Int;
}

contract TestComplexGet {
    result: Result;

    init() {
         self.result = Result{ res: 42 };
    }

    receive () {}

    get fun getComplex(param: Param): Result {
         return self.result;
    }
}
