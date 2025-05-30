struct Wrapper {
    num:Int;
    flag:Bool;
}

contract OptionalWrapper {
    a: Wrapper?;

    init() {
        self.a = null;
    }
}