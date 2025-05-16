struct SData {
    num: Int;
    flag: Bool;
}

contract InitAssignAndOverride {
    data: SData = SData{ num: 10, flag: true };

    init() {
        self.data = SData{ num: 42, flag: false };
    }
}