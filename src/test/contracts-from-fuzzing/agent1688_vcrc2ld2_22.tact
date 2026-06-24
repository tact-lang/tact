struct PS {
    x: Int;
    y: String;
}

contract TestContract {
    sopt1: PS?;
    val: Int;
    sopt2: PS?;

    init() {
        self.sopt1 = null;
        self.val = 42;
        self.sopt2 = PS{x:1,y:"hi"};
    }
}