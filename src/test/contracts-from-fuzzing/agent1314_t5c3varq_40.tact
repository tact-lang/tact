struct DualType {
    foo: Int;
    bar: Bool?;
}

contract DualTypeField {
    dt: DualType;

    init() {
        self.dt = DualType { foo:42, bar:null };
    }
}