////////// Test 6: Contract with contract parameters syntax
contract ParamSyntaxContract(param: Int) {
    // uses contract parameters syntax; no explicit init()
    receive() {}
}

contract CallerParams {
    receive() {
         let s = initOf ParamSyntaxContract(42);
         let cc = codeOf ParamSyntaxContract;
    }
}

////////// Test 7: Contract with multiple parameters using contract parameters syntax
contract MultiParamContract(param1: Int, param2: Int) {
    receive() {}
}

contract CallerMultiParam {
    receive() {
         let s = initOf MultiParamContract(1, 2);
         let cc = codeOf MultiParamContract;
    }
}

////////// Test 8: Contract with explicit init() and trailing comma in parameter list
contract TrailingCommaContract {
   init(a: Int, b: Int,) {
       // initialization logic
       // For this test, we do nothing
   }
   receive() {}
}

contract CallerTrailing {
   receive() {
         let s = initOf TrailingCommaContract(10, 20,);
         let cc = codeOf TrailingCommaContract;
   }
}

////////// Test 9: Using a non-constant expression as argument to initOf
contract VarInitContract {
   init(a: Int) {
       // no-op
   }
   receive() {}
}

contract CallerVar {
   receive() {
         let x = 5;
         let s = initOf VarInitContract(x);
         let cc = codeOf VarInitContract;
   }
}
