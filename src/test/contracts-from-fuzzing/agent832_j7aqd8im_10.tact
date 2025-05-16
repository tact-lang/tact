struct ComplexDefault {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultPersist {
    field: ComplexDefault = ComplexDefault{};
    receive() {
        let _ = self.field.z;
    }
}