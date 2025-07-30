contract TestContract {
    map1: map<Int, Int>;
    map2: map<Address, Bool>;
    flag: Bool;

    init() {
        self.flag = true;
    }
}