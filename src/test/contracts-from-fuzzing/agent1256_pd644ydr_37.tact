struct OneField {
    x: Int;
}
struct Wrap1 {
    a: OneField;
}
struct Wrap2 {
    b: Wrap1;
}
struct Wrap3 {
    c: Wrap2;
}

contract MultiWrapStruct {
    d: Wrap3;

    init() {
        self.d = Wrap3{ c: Wrap2{ b: Wrap1{ a: OneField{ x:7 }}}};
    }
}
