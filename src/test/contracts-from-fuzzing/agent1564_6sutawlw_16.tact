struct Small {
    val: Int as int4;
}

contract TinyIntStorage {
    smallVal: Small;

    init() {
        self.smallVal = Small{ val: 7 };
    }
}