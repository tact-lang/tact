primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (a > 5) {                 // Even though runtime execution will not enter the true branch,
            return 1 / (a - 5);      // we still need to report a division by zero inside, because 
        } else {                     // the error would occur IF the branch was executed: i.e.,
            return 0;                // it is a potential division by zero. 
        }                            // Also, we need to imitate the behavior of FunC, which actually 
    }                                // reports a division by zero in this case.
}