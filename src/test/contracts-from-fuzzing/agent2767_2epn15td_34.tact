// Edge case: persistent optional 'null' default plus explicit null init assignment
contract OptionalNullBoth {
    maybe: Int? = null;

    init() {
        self.maybe = null;
    }
}