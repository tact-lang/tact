const GlobalConst: Int = 10 + 5;

contract TestConst {
    get fun getConst(): Int {
        return GlobalConst;
    }
}
