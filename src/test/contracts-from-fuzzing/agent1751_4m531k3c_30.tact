struct E {
    x: Int;
    y: Bool;
}

const DEFAULT_E: E = E{ x:1, y:true };

contract AssignGlobalConst {
    val: E;

    init() {
        self.val = DEFAULT_E;
    }

    receive() {}
}