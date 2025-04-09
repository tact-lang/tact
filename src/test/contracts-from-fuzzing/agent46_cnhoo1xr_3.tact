const GLOBAL: Int = 100;

contract Test {
    const CONTRACT: Int = 42;
    get fun getSum(): Int {
         return GLOBAL + self.CONTRACT;
    }
}
