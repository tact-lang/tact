contract FieldOmissionInit {
    foo: Int = 7;
    bar: Bool;

    init() {
        self.bar = true;
    }
}