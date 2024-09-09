primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        repeat (x) {                     // Even though runtime execution will not enter the loop body,
            return 1 / (a - 5);          // we still need to report a division by zero inside, because 
        }                                // the error would occur IF the loop was executed: i.e.,
        return 0;                        // it is a potential division by zero. 
    }                                    // Also, we need to imitate the behavior of FunC, which actually 
}                                        // reports a division by zero in this case.
