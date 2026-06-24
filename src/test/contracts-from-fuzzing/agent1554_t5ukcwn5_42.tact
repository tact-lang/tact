struct NestOpt {
    x: Int;
}

contract OptStructNil {
    val: NestOpt?;

    init() {
        self.val = null;
    }
}