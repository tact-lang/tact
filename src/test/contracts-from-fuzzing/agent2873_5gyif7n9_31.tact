struct SerOpts {
    a: Int as int4;
    b: Int as int8;
    c: Int as int16;
}

contract SerOptsC {
    val: SerOpts;
    init() {
        self.val = SerOpts{a:3,b:7,c:100};
    }
}