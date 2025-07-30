struct BaseStruct {
    x: Int;
}

contract OptionalStructNullInit {
    opt: BaseStruct?;

    init() {
        self.opt = null;
    }
}