struct SubS { i: Int; }

contract OptionStruct {
    sub: SubS?;

    init() {
        self.sub = SubS{ i: 99 };
    }
}