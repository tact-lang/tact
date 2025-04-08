struct SubInner {
    x: Int;
    y: Bool?;
    s: String;
}

contract StructWithSubInner {
    si: SubInner;

    init() {
        self.si = SubInner{
            x: 77,
            y: null,
            s: "foo"
        };
    }
}