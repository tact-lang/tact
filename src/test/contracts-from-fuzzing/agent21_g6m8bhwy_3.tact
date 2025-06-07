const GlobalConst: Int = 10 + 5;

contract ConstTest {
    // contract constant
    const C: Int = 20 + 2;

    // Getter function returning the sum of global and contract constants
    get fun sum(): Int {
         return GlobalConst + self.C;
    }
}
