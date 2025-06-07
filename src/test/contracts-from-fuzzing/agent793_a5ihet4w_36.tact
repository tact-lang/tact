struct Basics {
    i: Int;
    flag: Bool;
    txt: String;
}

contract BasicNested {
    nested: Basics;

    init() {
        self.nested = Basics{i:42, flag:true, txt:"hey"};
    }

    receive() {}
}