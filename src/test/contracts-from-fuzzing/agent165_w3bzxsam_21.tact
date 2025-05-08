struct Param {
    x: Int;
    y: Int;
    label: String;
}

contract Defaulted {
    item: Param = Param{ x:0, y:0, label:"" };

    init() {
        self.item = Param{ x:1, y:2, label:"abc" };
    }
}