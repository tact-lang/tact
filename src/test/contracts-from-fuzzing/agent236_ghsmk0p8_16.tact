struct AnnotStruct {
    small: Int as uint8;
    big: Int;
}

contract TestContract {
    data: AnnotStruct;

    init() {
        self.data = AnnotStruct{small:5, big:-999};
    }
}