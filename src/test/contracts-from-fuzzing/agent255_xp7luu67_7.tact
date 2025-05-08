struct Param {
    id: Int;
    flag: Bool;
}

contract TestContract {
    first: Param;
    second: Param;
    third: Param;

    init() {
        self.first = Param{id:1, flag:true};
        self.second = Param{id:2, flag:false};
        self.third = Param{id:3, flag:true};
    }
}