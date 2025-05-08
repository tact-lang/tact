struct ConstStruct {
    x: Int;
    y: Int;
}

contract ConstVsVar {
    s: ConstStruct = ConstStruct{ x:1, y:2 };

    get fun getx(): Int { return self.s.x; }
}