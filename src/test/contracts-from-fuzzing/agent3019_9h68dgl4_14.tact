struct Param {
    count: Int = 0;
    active: Bool = false;
    note: String = "";
}

contract TestContract {
    param1: Param = Param{};
    param2: Param = Param{};
    balance: Int = 777;
}