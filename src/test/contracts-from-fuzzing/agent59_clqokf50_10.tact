fun multiplyAdd(x: Int, y: Int): Int { return x * 2 + y; }

contract TestFunctionCallChain {
    receive() {
        let result: Int = multiplyAdd(2 + 3, 4 * 2);
        // Expected: (2+3)=5 *2 = 10, plus (4*2)=8, equals 18
        dump(result);
    }
}
