struct GroupA {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct GroupB {
    f4: Int;
    f5: Bool;
    f6: String;
}

contract Mix {
    gA: GroupA;
    gB: GroupB;

    init() {
        self.gA = GroupA{f1: 1, f2: true, f3: "a"};
        self.gB = GroupB{f4: 2, f5: false, f6: "b"};
    }
}